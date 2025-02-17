`timescale 1ns/1ps

module async_fifo_top_tb;

	parameter real WCLK_FRQ = 100;					//Unit: MHz
	parameter real RCLK_FRQ = 60;					//Unit: MHz
	parameter real WCLK_T = ((1/WCLK_FRQ)*1000);
	parameter real RCLK_T = ((1/RCLK_FRQ)*1000);
	parameter DATA_WIDTH=8;
	parameter ADDR_WIDTH=4;

	logic [DATA_WIDTH-1:0] rdata;
	logic wfull,rempty;
	logic [DATA_WIDTH-1:0] wdata;
	logic winc, wclk, wrst_n;
	logic rinc, rclk, rrst_n;
	
	int error = 0;

	asynch_fifo_dut #(8,4) DUT(.*);
	
	`ifdef DEBUG
		initial 
		begin 
		$display("rdata\t\trinc\trrst_n\twinc\twrst_n\twfull\trempty\twdata");
		$monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t", rdata, rinc, rrst_n, winc, wrst_n, wfull, rempty, wdata);
		end
	`endif
	
	initial begin
    	rclk = 0;
    	forever #((RCLK_T)/2) rclk = ~rclk;
    	// forever #(7) rclk = ~rclk;
	end

	initial begin
    	wclk = 0;
		forever #((WCLK_T)/2) wclk = ~wclk;
    	// forever #(5) wclk = ~wclk;
	end

	task WriteFIFO(input int i);
		if (wfull)
		begin
			error++;
			$display ("FIFO is full");
		end
		else begin
			wdata = i;
			winc = 1;
		end
	endtask
	
	task ReadFIFO;
		if(rempty)
		begin
			error++;
			$display("FIFO is empty");
		end
		else begin
			rinc = 1;
		end
	endtask

	//assertions
	//FIFO should be empty after a reset
	property p_fifo_wrst;
		@(posedge wclk)
		!wrst_n |=> !wfull;
	endproperty
	a_fifo_wrst: assert property(p_fifo_wrst) else $error("Fifo Full should be deasserted after reset");

	property p_fifo_rrst;
		@(posedge rclk)
		!rrst_n |=> rempty;
	endproperty
	a_fifo_rrst: assert property(p_fifo_rrst) else $error("Fifo Empty should be asserted after reset");

	//FIFO cannot be full and empty at the same time
	property p_fifo_empty;
		@(posedge rclk) disable iff(rrst_n)
		wfull |-> !rempty;
	endproperty
	a_fifo_empty: assert property(p_fifo_empty) else $error("Fifo Empty should be deasserted when FIFO is Full");

	property p_fifo_full;
		@(posedge wclk) disable iff(wrst_n)
		rempty |-> !wfull;
	endproperty
	a_fifo_full: assert property(p_fifo_full) else $error("Fifo Full should be deasserted when FIFO is Empty");

	//When rinc is high and fifo is not empty, rdata should have correct data
	property p_stable_rdata;
		@(posedge rclk) disable iff(rrst_n)
		rinc && !rempty |=> $stable(rdata);
	endproperty
	a_stable_rdata: assert property(p_stable_rdata) else $error("rdata should have correct data when rinc is set and FIFO is not empty");

	//When winc is high and fifo is not full, wdata should have correct data
	property p_stable_wdata;
		@(posedge wclk) disable iff(wrst_n)
		winc && !wfull |-> $stable(wdata);
	endproperty
	a_stable_wdata: assert property(p_stable_wdata) else $error("wdata should be stable when winc is set and FIFO is not full");

	//After a FIFO read, FIFO cannot be full
	property p_fifoflags_wfull;
		@(posedge wclk) disable iff(wrst_n)
		rinc |=> !wfull;
	endproperty
	a_fifoflags_wfull: assert property(p_fifoflags_wfull) else $error("After a FIFO read, FIFO cannot be full");

	//After a FIFO write, FIFO cannot be empty
	property p_fifoflags_rempty;
		@(posedge rclk) disable iff(rrst_n)
		winc |=> !rempty;
	endproperty
	a_fifoflags_rempty: assert property(p_fifoflags_rempty) else $error("After a FIFO write, FIFO cannot be empty");

	//If FIFO is full, it cannot be written to
	property p_fifoflags_full;
		@(posedge wclk) disable iff(wrst_n)
		winc && wfull |=> !winc;
	endproperty
	a_fifoflags_full: assert property(p_fifoflags_full) else $error("If FIFO is full, it cannot be written to");

	//If FIFO is empty, it cannot be read
	property p_fifoflags_empty;
		@(posedge rclk) disable iff(rrst_n)
		rinc && rempty |=> !rinc;
	endproperty
	a_fifoflags_empty: assert property(p_fifoflags_empty) else $error("If FIFO is empty, it cannot be read");
		
	initial begin
		wrst_n = 0;
		rrst_n = 0;
		fork
			@(negedge wclk);
			@(negedge rclk);
		join
		wrst_n = 1;
		rrst_n = 1;
		
		@(negedge wclk);
		//write to FIFO
		for (int i = 0; i < 2**ADDR_WIDTH; i++)
		begin
			WriteFIFO(i);
			@(negedge wclk);
			winc = 0;
		end
		
		@(negedge rclk);
		// //check if FIFO is full
		// WriteFIFO(500);
		// #100;

		for (int j = 0; j < 2**ADDR_WIDTH; j++) begin
			ReadFIFO();
			@(negedge rclk);
			rinc = 0;
			if (rdata != j) begin
				$display("ERROR");
				$display("%t Expected: %0d. Actual: %0d",$time, j, rdata);
				error++;
			end
		end
		
		// //check if fifo is empty
		// ReadFIFO();
		// #100;

		if (error==2) 
			$display("FIFO passed all tests!");
		
		$display("WCLK_T/2 = %.2f", WCLK_T);
		$display("RCLK_T/2 = %.2f", RCLK_T);
		$finish;
	end

endmodule
