class async_fifo_seqr extends uvm_sequencer #(async_fifo_trans);

    `uvm_component_utils(async_fifo_seqr)

    function new(string name = "async_fifo_seqr", uvm_component parent);
        super.new(name,parent);
    endfunction

endclass : async_fifo_seqr