module rptr_empty #(parameter ADDR_WIDTH = 4) (output reg rempty,
											   output [ADDR_WIDTH-1:0] raddr,
											   output reg [ADDR_WIDTH :0] rptr,
											   input [ADDR_WIDTH :0] rq2_wptr,
											   input rinc, rclk, rrst_n);

	logic [ADDR_WIDTH:0] rbin;
	logic [ADDR_WIDTH:0] rgraynext, rbinnext;
	logic rempty_val;

	//-------------------
	// GRAYSTYLE2 pointer
	//-------------------
	always_ff@(posedge rclk or negedge rrst_n)
	begin
		if(!rrst_n)
			{rbin, rptr} <= 0;
		else
			{rbin, rptr} <= {rbinnext, rgraynext};
	end

	// Memory read-address pointer (okay to use binary to address memory)
	assign raddr = rbin[ADDR_WIDTH-1:0];
	assign rbinnext = rbin + (rinc & ~rempty);
	assign rgraynext = (rbinnext>>1) ^ rbinnext;

	//---------------------------------------------------------------
	// FIFO empty when the next rptr == synchronized wptr or on reset
	//---------------------------------------------------------------
	assign rempty_val = (rgraynext == rq2_wptr);

	always_ff@(posedge rclk or negedge rrst_n)
	begin
		if(!rrst_n) 
			rempty <= 1'b1;
		else
			rempty <= rempty_val;
	end

endmodule