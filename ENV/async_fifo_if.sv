interface async_fifo_if #(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=4)(input wclk, wrst_n, rclk, rrst_n);

    logic [DATA_WIDTH-1:0] wdata;
	logic winc;
	logic rinc;

	//Local variables
	logic [DATA_WIDTH-1:0] rdata;
	logic rempty;
	logic wfull;

endinterface : async_fifo_if