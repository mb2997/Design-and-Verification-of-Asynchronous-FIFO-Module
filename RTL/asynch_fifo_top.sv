module asynch_fifo_top #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) (output [DATA_WIDTH-1:0] rdata,
                                                                output wfull,
                                                                output rempty,
                                                                input [DATA_WIDTH-1:0] wdata,
                                                                input winc, wclk, wrst_n,
                                                                input rinc, rclk, rrst_n);

    logic [ADDR_WIDTH-1:0] waddr, raddr;
    logic [ADDR_WIDTH-1:0] wptr, rptr, wq2_rptr, rq2_wptr;

    

endmodule