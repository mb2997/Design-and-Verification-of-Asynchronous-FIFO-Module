class scoreboard #(parameter DATA_WIDTH=8, ADDR_WIDTH=4);

	// mailbox mon_in2scb;
	// mailbox mon_out2scb;
	// virtual async_fifo_interface vif;

	// parameter MEMDEPTH = 1<<ADDR_WIDTH;
	// logic [DATA_WIDTH-1:0] ex_mem [0:MEMDEPTH-1];
	// logic [DATA_WIDTH-1:0] exp_rdata;
	// int wr_ptr,rd_ptr,fifo_count;
	// logic full,empty;


	// function new (mailbox mon_in2scb, mailbox mon_out2scb);
	// 	this.mon_in2scb = mon_in2scb;
	// 	this.mon_out2scb = mon_out2scb;
	// 	wr_ptr = 0;
	// 	rd_ptr = 0;
	// 	fifo_count = 0;
	// 	full = '0;
	// 	empty = '0;
	// endfunction

	task run();
		fork
			// get_input();
			// get_output();
		join_none
	endtask

	// task get_input();
	// 	transaction #(DATA_WIDTH) tx;
	// 	forever begin
	// 		mon_in2scb.get(tx);
	// 		if (tx.wrst_n) wr_ptr = 0; 
	// 		if (tx.rrst_n) rd_ptr = 0;
	// 		if (tx.winc && !full)
	// 		begin
	// 			ex_mem[wr_ptr] = tx.wdata;
	// 			wr_ptr = (wr_ptr+1)%MEMDEPTH;
	// 			fifo_count ++;
	// 			if (fifo_count == MEMDEPTH) 
	// 				full = 1;
	// 		end
	// 		if (tx.rinc && !empty)
	// 		begin
	// 			exp_rdata = ex_mem[wr_ptr];
	// 			rd_ptr = (rd_ptr+1)%MEMDEPTH;
	// 			fifo_count --;
	// 			if (fifo_count == 0) 
	// 				empty = 1;
	// 		end
	// 	end
	// endtask

	// task get_output();
	// 	transaction #(DATA_WIDTH) tx;
	// 	forever 
	// 	begin
	// 		mon_out2scb.get(tx);
	// 		if (exp_rdata !== tx.rdata)
	// 			$display("Error: %t Expected = %b, Actual = %b",$time,exp_rdata,tx.rdata);
	// 		if (empty !== tx.rempty)
	// 			$display("Error: %t Expected = %b, Actual = %b",$time,empty,tx.rempty);
	// 		if (full !== tx.wfull)
	// 			$display("Error: %t Expected = %b, Actual = %b",$time,full,tx.wfull);
	// 	end
	// endtask

	// covergroup cg_fifo_write;
	// 	coverpoint wrst_n {
	// 		bins set = ('0 => '1);
	// 		bins reset = ('1 => '0);
	// 	}
	// 	coverpoint winc {
	// 		bins values = {1'b0,1'b1};
	// 	}
	// 	coverpoint wdata {
	// 		bins values = {[{DATA_WIDTH{1'b0}}:{DATA_WIDTH{1'b1}}]};
	// 	}
	// endgroup

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