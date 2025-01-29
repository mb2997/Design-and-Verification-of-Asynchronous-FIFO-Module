module top;

	parameter DATA_WIDTH=8;
	parameter ADDR_WIDTH=10;

	logic [DATA_WIDTH-1:0] rdata;
	logic wfull,rempty;
	logic [DATA_WIDTH-1:0] wdata;
	logic winc, wclk, wrst_n;
	logic rinc, rclk, rrst_n;
	
	int error = 0;

	asynch_fifo_top #(8,10) DUT(.*);
	
	`ifdef DEBUG
		initial 
		begin 
		$display("rdata\t\trinc\trrst_n\twinc\twrst_n\twfull\trempty\twdata");
		$monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d\t%b\t%d", rdata, rinc, rrst_n, winc, wrst_n, wfull, rempty, wdata);
		end
	`endif
	
	
	initial begin
    	rclk = 0;
    	forever #7 rclk = !rclk;
	end
	initial begin
    	wclk = 0;
    	forever #10 wclk = !wclk;
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
			wait(wclk);
			winc = 0;
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
			wait(rclk);
			rinc = 0;
		end
	endtask
	
	initial begin
		#20;
		wrst_n = 1;
		rrst_n = 1;
		#20;
		
		//write to FIFO
		for (int i = 0; i < 2**ADDR_WIDTH; i++) begin
			WriteFIFO(i);
			#100;
		end
		
		//check if FIFO is full
		WriteFIFO(500);
		#100;

		for (int j = 0; j < 2**ADDR_WIDTH; j++) begin
			ReadFIFO();
			#100;
			if (rdata != j) begin
				$display("ERROR");
				$display("%t Expected: %0d. Actual: %0d",$time, j, rdata);
				error++;
			end
		end
		
		//check if fifo is empty
		ReadFIFO();
		#100;

		if (error==2) 
			$display("FIFO passed all tests!");
		$finish;
	end

endmodule
