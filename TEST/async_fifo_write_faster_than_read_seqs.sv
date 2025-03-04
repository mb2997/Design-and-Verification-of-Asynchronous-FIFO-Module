class async_fifo_write_faster_than_read_seqs #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends async_fifo_seqs;

    `uvm_object_param_utils(async_fifo_write_faster_than_read_seqs)

    function new(string name = "async_fifo_write_faster_than_read_seqs");
        super.new(name);
    endfunction

    task body();
        trans_h = async_fifo_trans #(DATA_WIDTH) :: type_id :: create("trans_h");

        fork
            check_fifo_full();
        join_none

        repeat(DEPTH)
        begin
            assert(trans_h.randomize());
            start_item(trans_h);
            finish_item(trans_h);
        end

    endtask

endclass : async_fifo_write_faster_than_read_seqs