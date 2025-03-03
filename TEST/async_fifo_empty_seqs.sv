class async_fifo_empty_seqs #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends async_fifo_seqs;

    `uvm_object_param_utils(async_fifo_empty_seqs)

    function new(string name = "async_fifo_empty_seqs");
        super.new(name);
    endfunction

    task body();
        trans_h = async_fifo_trans #(DATA_WIDTH) :: type_id :: create("trans_h");
        repeat(DEPTH+4)
        begin
            assert(trans_h.randomize() with {winc == 1; rinc == 0;});

            start_item(trans_h);

            finish_item(trans_h);
        end
        
        repeat(DEPTH+4)
        begin
            assert(trans_h.randomize() with {winc == 0; rinc == 1;});

            start_item(trans_h);

            finish_item(trans_h);
        end
        repeat(DEPTH+4)
        begin
            assert(trans_h.randomize() with {winc == 1; rinc == 0;});

            start_item(trans_h);

            finish_item(trans_h);
        end
        
        repeat(DEPTH+4)
        begin
            assert(trans_h.randomize() with {winc == 0; rinc == 1;});

            start_item(trans_h);

            finish_item(trans_h);
        end
    endtask

endclass : async_fifo_empty_seqs