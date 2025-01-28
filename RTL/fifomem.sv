module fifomem #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) (output [DATASIZE-1:0] rdata,
                                                        input [DATASIZE-1:0] wdata,
                                                        input [ADDRSIZE-1:0] waddr, raddr,
                                                        input wclken, wfull, wclk);

    //Memory model depth
    localparam FIFO_DEPTH = 1 << ADDR_WIDTH;

    //Memory declaration
    logic [DATA_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];

    //rdata output logic
    assign rdata = mem[raddr];

    always@(posedge clk)
    begin
        if(wclken && !wfull)
        begin
            mem[waddr] <= wdata;
        end
    end

endmodule