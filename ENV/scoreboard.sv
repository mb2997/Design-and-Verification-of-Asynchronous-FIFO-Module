class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard);
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	uvm_analysis_imp #(seq_item,scoreboard) monitor_analysis_imp;
	
	virtual async_fifo_interface vif;
	
	uvm_tlm_analysis_fifo #(seq_item) analysis_fifo;
	
	parameter MEMDEPTH = 1<<ADDR_WIDTH;
	logic [DATA_WIDTH-1:0] mem_model [int];
	logic [DATA_WIDTH-1:0] exp_rdata;
	logic [ADDR_WIDTH:0] wr_ptr, rd_ptr;
	int fifo_count;
	logic full,empty;
		
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_analysis_imp = new("monitor_analysis_imp",this);
		analysis_fifo = new("analysis_fifo",this);
		if(!(uvm_config_db#(virtual async_fifo_interface)::get(this,"*","vif",vif)))
			`uvm_error("async_fifo","Failed to get vif from config DB!");
	endfunction
	
	function void write (seq_item item);
		analysis_fifo.write(item);
	endfunction
	
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq_item item;
		if(sb_enable) begin
		begin
			analysis_fifo.get(item)
			fork
				get_data_from_wmon(item);
				get_data_from_rmon(item);
			join
		end
	endtask
	
	task get_data_from_wmon(seq_item item);
		forever
		begin
			@(negedge vif.wclk);
			if(item.winc)
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
					mem_model[wr_ptr] = item.wdata;
					//$display("The %0d Data has been written into mem_model at %0d", item.wdata, wr_ptr);
					wr_ptr++;
				end
			end
		end
	endtask
	
	task get_data_from_rmon(seq_item item);
		forever
		begin
			@(negedge vif.rclk);
			if(item.rinc)
			begin
				if(mem_model.exists(rd_ptr))
				begin
					exp_rdata = mem_model[rd_ptr];
					if(exp_rdata != item.rdata)
					begin
						$display("------------------------------------------------------------------------------------------------------");
						$display("||MIS-MATCHED|| At Time = %0t => SCOREBOARD FAILED: rdata = %0d != exp_rdata = %0d", $time, item.rdata, exp_rdata);
						$display("------------------------------------------------------------------------------------------------------");
					end
					else
					begin
						$display("------------------------------------------------------------------------------------------------------");
						$display("||MATCHED|| At Time = %0t => SCOREBOARD PASSED: rdata = %0d == exp_rdata = %0d", $time, item.rdata, exp_rdata);
						$display("------------------------------------------------------------------------------------------------------");
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
endclass



	