module rptr_empty #(parameter ADDRSIZE = 4)
(
    output logic                   rempty,
    output logic [ADDRSIZE-1:0]    addr,
    output logic [ADDRSIZE:0]      rptr,
    input  logic [ADDRSIZE:0]      rq2_wptr,
    input  logic                   rinc,
    input  logic                   rclk,
    input  logic                   rrst_n
);

    logic [ADDRSIZE:0] rbin;
    logic [ADDRSIZE:0] rgraynext, rbinnext;
    logic empty;

    /////////////////////
    // GRAYSTYLE pointer
    /////////////////////
    always @(posedge rclk or negedge rrst_n)
    begin
        if (!rrst_n)
            {rbin, rptr} <= 0;
        else
            {rbin, rptr} <= {rbinnext, rgraynext};
    end

    // Memory read-address pointer (okay to use binary to address memory)
    assign addr = rbin[ADDRSIZE-1:0];
    assign rbinnext = rbin + (rinc & ~empty);
    assign rgraynext = (rbinnext >> 1) ^ rbinnext;

    //////////////////////////////////////////////////////////////
    // FIFO empty when the next rptr == synchronized wptr or on reset
    //////////////////////////////////////////////////////////////

    assign empty = (rgraynext == rq2_wptr);

    always @(posedge rclk or negedge rrst_n)
    begin
        if (!rrst_n)
            rempty <= 1'b1;
        else
            rempty <= empty;
    end

endmodule
