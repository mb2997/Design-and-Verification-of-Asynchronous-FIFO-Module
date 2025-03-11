class async_fifo_seqs #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends uvm_sequence #(async_fifo_trans);

    `uvm_object_param_utils(async_fifo_seqs)

    parameter DEPTH = 1 << ADDR_WIDTH;

    async_fifo_trans #(DATA_WIDTH) trans_h;

    function new(string name = "async_fifo_seqs");
        super.new(name);
    endfunction

    task body();
        trans_h = async_fifo_trans #(DATA_WIDTH) :: type_id :: create("trans_h");
        repeat(no_of_trans)
        begin
            assert(trans_h.randomize() with {winc == 1 && rinc == 0;});
            begin
                //$cast(req, trans_h.clone());
                start_item(trans_h);
                `uvm_info("async_fifo_seqs : ",$sformatf("Packet Generated at SEQS is %s", trans_h.sprint()),UVM_MEDIUM)
                finish_item(trans_h);
            end
        end
    endtask

endclass : async_fifo_seqs