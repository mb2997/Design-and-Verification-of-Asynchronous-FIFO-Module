class async_fifo_sb #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends uvm_scoreboard;

    //Factory registration
    `uvm_component_utils(async_fifo_sb)

    async_fifo_trans #(DATA_WIDTH) trans_h;

    //analysis fifo declaration
    uvm_tlm_analysis_fifo #(async_fifo_trans) wmon2sb_af;
    uvm_tlm_analysis_fifo #(async_fifo_trans) rmon2sb_af;

    //Taking handles of async_fifo_wtrans and async_fifo_rtrans for collection of data from wmon and rmon analysis interface
    //async_fifo_trans trans_h;
    virtual async_fifo_if vif;

    //Declaration of queue array to compare elements
    bit [7:0]actual_data_qarray[$];
    bit [7:0]expected_data_qarray[$];
    bit [3:0]actual_rd_addr_qarray[$];

    parameter MEMDEPTH = 1<<ADDR_WIDTH;
	logic [DATA_WIDTH-1:0] mem_model [int];
	logic [DATA_WIDTH-1:0] exp_rdata;
	logic [DATA_WIDTH-1:0] wdata_q [$];
	logic [DATA_WIDTH-1:0] rdata_q [$];
	logic [ADDR_WIDTH-1:0] wr_ptr, rd_ptr;
	int fifo_count;
	logic full,empty;

    //Functional Coverage Logic
    covergroup cg_fifo_write;
		
		WDATA	:	coverpoint vif.wdata
					{
						bins LOW	=	{0};
						bins MED 	= 	{[1:(2**DATA_WIDTH)-2]};
						bins HIGH 	= 	{2**DATA_WIDTH-1};
					}

	    WFULL	:	coverpoint vif.wfull;

		WINC	: 	coverpoint vif.winc; 

		WINCxWDATA	: cross WINC, WDATA
					  {
						ignore_bins IBINS = binsof(WINC) intersect {0};
					  }

	endgroup

	covergroup cg_fifo_read;
		
		RDATA	:	coverpoint vif.rdata
					{
						bins LOW	=	{0};
						bins MED 	= 	{[1:(2**DATA_WIDTH)-2]};
						bins HIGH 	= 	{2**DATA_WIDTH-1};
					}
		
		REMPTY	:	coverpoint vif.rempty;

		RINC	: 	coverpoint vif.rinc; 

		RINCxRDATA	: cross RINC, RDATA
					  {
						ignore_bins IBINS = binsof(RINC) intersect {0};
		  			  }

	endgroup

    //Function new - constructor
    function new(string name = "async_fifo_sb", uvm_component parent = null);
        super.new(name, parent);
        wmon2sb_af = new("wmon2sb_af",this);
        rmon2sb_af = new("rmon2sb_af",this);
        wr_ptr = 0;
		rd_ptr = 0;
		fifo_count = 0;
		full = 0;
		empty = 0;
		cg_fifo_write = new();
		cg_fifo_read = new();
    endfunction

    function void build_phase(uvm_phase phase);
        if(!uvm_config_db #(virtual async_fifo_if) :: get(this," ","vif",vif))
            `uvm_fatal("async_fifo_SB : ", $sformatf("Can't able to get vif... Have you set it ??"))
    endfunction

    function void report_phase(uvm_phase phase);
        foreach(mem_model[i])
        begin
            $display("mem_model[%0d] = %0d",i,mem_model[i]);
        end
    endfunction

    task sample_method_for_write();
		forever
		begin
			@(posedge vif.wclk);
			cg_fifo_write.sample();
		end
	endtask

	task sample_method_for_read();
		forever
		begin
			@(posedge vif.rclk);
			cg_fifo_read.sample();
		end
	endtask

    task run_phase(uvm_phase phase);
        fork
			sample_method_for_write();
			sample_method_for_read();
		join_none
		
		if(sb_enable)
		begin
			fork
				get_data_from_wmon();
				get_data_from_rmon();
			join
		end
    endtask

    task get_data_from_wmon();
		forever
		begin
			trans_h = new();
			@(posedge vif.wclk);
			wmon2sb_af.get(trans_h);
			if(trans_h.winc)
			begin
				if(vif.wfull)
				begin
					$display("---------------------------------------------------------------");
                    $display($time," -- ERROR : FIFO FULL --> We can't write");
                    $display("---------------------------------------------------------------");
					break;
				end
				else
				begin
					if(vif.wrst_n) begin
					mem_model[wr_ptr] = trans_h.wdata;
					wdata_q.push_back(trans_h.wdata);
					//$display("The %0d Data has been written into mem_model at %0d", trans_h.wdata, wr_ptr);
					wr_ptr++;
					end
				end
			end
		end
	endtask

	task get_data_from_rmon();
		forever
		begin
			trans_h = new();
			//@(negedge vif.rclk);
			rmon2sb_af.get(trans_h);
			if(trans_h.rinc)
			begin
				if(mem_model.exists(rd_ptr) && trans_h.rdata)
				begin
					exp_rdata = trans_h.rdata;
					rdata_q.push_back(exp_rdata);
					//$display("The %0d Data has been read from mem_model at %0d", trans_h.rdata, rd_ptr);
					// if(exp_rdata != trans_h.rdata)
					// begin
					// 	$display("------------------------------------------------------------------------------------------------------");
					// 	$display("||MIS-MATCHED|| At Time = %0t => SCOREBOARD FAILED: rdata = %0d != exp_rdata = %0d", $time, trans_h.rdata, exp_rdata);
					// 	$display("------------------------------------------------------------------------------------------------------");
					// end
					// else
					// begin
					// 	$display("------------------------------------------------------------------------------------------------------");
					// 	$display("||MATCHED|| At Time = %0t => SCOREBOARD PASSED: rdata = %0d == exp_rdata = %0d", $time, trans_h.rdata, exp_rdata);
					// 	$display("------------------------------------------------------------------------------------------------------");
					// end
					$display("wdata_q = %p", wdata_q);
					$display("rdata_q = %p", rdata_q);
 					rd_ptr++;
				end
				else
				begin
					$display("---------------------------------------------------------------");
                    $display($time," -- SB ERROR : FIFO EMPTY --> We can't Read");
                    $display("---------------------------------------------------------------");
					break;
				end
			end
		end
	endtask

	function void extract_phase(uvm_phase phase);
		if(rdata_q.size() != 0) begin
		$display("\n------------------------------------------------------------------------");
		$display("\t\t\tSCOREBOARD SUMMARY										");
		$display("------------------------------------------------------------------------\n");
		foreach(rdata_q[i])
		begin
			if(rdata_q[i] == wdata_q[i])
				`uvm_info("SB PASSED:", $sformatf("|DATA MATCHED| => rdata: %0d == wdata: %0d", rdata_q[i], wdata_q[i]), UVM_LOW)
			else
				`uvm_error("SB FAILED:", $sformatf("|DATA MIS-MATCHED| => rdata: %0d != wdata: %0d", rdata_q[i], wdata_q[i]))
		end
		$display("------------------------------------------------------------------------");
	end
	endfunction

endclass : async_fifo_sb