interface async_fifo_interface #(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=4)(input wclk, wrst_n, rclk, rrst_n);
	
	logic [DATA_WIDTH-1:0] rdata;
	logic wfull;
	logic rempty;
	logic [DATA_WIDTH-1:0] wdata;
	logic winc;
	logic rinc;

endinterface