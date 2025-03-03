class async_fifo_write_at_full_seqs #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends async_fifo_seqs;

    `uvm_object_param_utils(async_fifo_write_at_full_seqs)

    function new(string name = "async_fifo_write_at_full_seqs");
        super.new(name);
    endfunction

    task body();
        trans_h = async_fifo_trans #(DATA_WIDTH) :: type_id :: create("trans_h");
        repeat(DEPTH+25)
        begin
            assert(trans_h.randomize() with {winc == 1; rinc == 0;});

            //start_item is waiting for "get_next_item" which is called by driver component in run_phase
            start_item(trans_h);

            //finish_item give response to driver component for packet generation completion
            finish_item(trans_h);
            
        end
    endtask

endclass : async_fifo_write_at_full_seqs