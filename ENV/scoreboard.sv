class scoreboard #(parameter DATA_WIDTH=8, ADDR_WIDTH=4);

	transaction #(DATA_WIDTH) trans_h;
	mailbox#(transaction) wmon2sb;
	mailbox#(transaction) rmon2sb;
	virtual async_fifo_interface vif;

	parameter MEMDEPTH = 1<<ADDR_WIDTH;
	logic [DATA_WIDTH-1:0] mem_model [int];
	logic [DATA_WIDTH-1:0] exp_rdata;
	logic [ADDR_WIDTH:0] wr_ptr, rd_ptr;
	int fifo_count;
	logic full,empty;

	covergroup cg_fifo_write @(vif.wclk);
		
		WRST_N	:	coverpoint vif.wrst_n;

		WDATA	:	coverpoint trans_h.wdata
					{
						bins LOW	=	{0};
						bins MED 	= 	{[1:(2**DATA_WIDTH)-2]};
						bins HIGH 	= 	{(2**DATA_WIDTH)-1};
					}

	endgroup

	covergroup cg_fifo_read @(vif.rclk);
		
		RRST_N	:	coverpoint vif.rrst_n;

		RDATA	:	coverpoint trans_h.rdata
					{
						bins LOW	=	{0};
						bins MED 	= 	{[1:(2**DATA_WIDTH)-2]};
						bins HIGH 	= 	{(2**DATA_WIDTH)-1};
					}

	endgroup

	function new (virtual async_fifo_interface vif,
		mailbox#(transaction) wmon2sb,
		mailbox#(transaction) rmon2sb);
		this.vif = vif;
		this.wmon2sb = wmon2sb;
		this.rmon2sb = rmon2sb;
		wr_ptr = 0;
		rd_ptr = 0;
		fifo_count = 0;
		full = 0;
		empty = 0;
		cg_fifo_write = new();
	endfunction

	task run();
		transaction trans_h;
		fork
			get_data_from_wmon();
			get_data_from_rmon();
		join
	endtask

	task get_data_from_wmon();
		forever
		begin
			trans_h = new();
			@(negedge vif.wclk);
			wmon2sb.get(trans_h);
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
					mem_model[wr_ptr] = trans_h.wdata;
					//$display("The %0d Data has been written into mem_model at %0d", trans_h.wdata, wr_ptr);
					wr_ptr++;
				end
			end
		end
	endtask

	task get_data_from_rmon();
		forever
		begin
			trans_h = new();
			@(negedge vif.rclk);
			rmon2sb.get(trans_h);
			if(trans_h.rinc)
			begin
				if(mem_model.exists(rd_ptr))
				begin
					exp_rdata = mem_model[rd_ptr];
					if(exp_rdata != trans_h.rdata)
					begin
						$display("||MIS-MATCHED|| At Time = %0t => SCOREBOARD FAILED: rdata = %0d != exp_rdata = %0d", $time, trans_h.rdata, exp_rdata);
					end
					else
					begin
						$display("||MATCHED|| At Time = %0t => SCOREBOARD PASSED: rdata = %0d == exp_rdata = %0d", $time, trans_h.rdata, exp_rdata);
					end
 					rd_ptr++;
				end
				else
				begin
					$display("---------------------------------------------------------------");
                    $display($time," -- ERROR : FIFO EMPTY --> We can't Read");
                    $display("---------------------------------------------------------------");
					break;
				end
			end
		end
	endtask


	// covergroup cg_fifo_read;
	// 	coverpoint rrst_n {
	// 		bins set = ('0 => '1);
	// 		bins reset = ('1 => '0);
	// 	}
	// 	rin: coverpoint rinc {
	// 		bins values = {1'b0,1'b1};
	// 	}
	// 	coverpoint rdata {
	// 		bins values = {[{DATA_WIDTH{1'b0}}:{DATA_WIDTH{1'b1}}]};
	// 	}
	// endgroup

	// covergroup cg_fifo_inputs;
	// 	win: coverpoint winc {
	// 		bins values = {1'b0,1'b1};
	// 	}
	// 	rin: coverpoint rinc {
	// 		bins values = {1'b0,1'b1};
	// 	}
	// 	cross win, rin;
	// endgroup

	// covergroup cg_wfifo_flags;
	// 	coverpoint wfull{
	// 		bins values = {1'b0,1'b1};
	// 	}
	// endgroup

	// covergroup cg_rfifo_flags;
	// 	coverpoint rempty{
	// 		bins values = {1'b0,1'b1};
	// 	}
	// endgroup

endclass