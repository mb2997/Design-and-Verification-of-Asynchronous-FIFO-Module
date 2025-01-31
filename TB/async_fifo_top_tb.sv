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
