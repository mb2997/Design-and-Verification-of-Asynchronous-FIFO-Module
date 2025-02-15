module kgm_async_fifo #(
	parameter DSIZE = 8,
	parameter ASIZE = 4)(
	rdata,wfull,rempty,wdata,
	winc, wclk, wrst_n,
	rinc, rclk, rrst_n);

	output logic [DSIZE-1:0] rdata;
	output logic wfull;
	output logic rempty;
	input logic [DSIZE-1:0] wdata;
	input logic winc, wclk, wrst_n;
	input logic rinc, rclk, rrst_n;	
	
	logic [ASIZE:0] wptr, wrptr1, wrptr2, wrptr3;
	logic [ASIZE:0] rptr, rwptr1, rwptr2, rwptr3;
	
	parameter MEMDEPTH = 1<<ASIZE;
	logic [DSIZE-1:0] ex_mem [0:MEMDEPTH-1];
	
	always_ff @(posedge wclk, negedge wrst_n)
	begin
		if (!wrst_n) 
			wptr <= 0;
		else if (winc && !wfull) 
		begin
			ex_mem[wptr[ASIZE-1:0]] <= wdata;
			wptr <= wptr+1;
		end
	end
	
	always_ff @(posedge wclk,negedge wrst_n)
	begin
		if (!wrst_n) 
			{wrptr3,wrptr2,wrptr1} <= 0;
		else 
			{wrptr3,wrptr2,wrptr1} <= {wrptr2,wrptr1,rptr};
	end
	
	always_ff @(posedge rclk,negedge rrst_n)
	begin
		if (!rrst_n) 
			rptr <= 0;
		else if (rinc && !rempty) 
			rptr <= rptr+1;
	end
	
	always_ff @(posedge rclk,negedge rrst_n)
	begin
		if (!rrst_n) 
			{rwptr3,rwptr2,rwptr1} <= 0;
		else 
			{rwptr3,rwptr2,rwptr1} <= {rwptr2,rwptr1,wptr};
	end
	
	assign rdata = ex_mem[rptr[ASIZE-1:0]];
	assign rempty = (rptr == rwptr3);
	assign wfull = ((wptr[ASIZE-1:0] == wrptr3[ASIZE-1:0]) &&
	(wptr[ASIZE] != wrptr3[ASIZE] ));
	
endmodule
