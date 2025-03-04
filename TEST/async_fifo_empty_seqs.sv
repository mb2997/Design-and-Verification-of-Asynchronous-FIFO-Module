class async_fifo_empty_seqs #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends async_fifo_seqs;

    `uvm_object_param_utils(async_fifo_empty_seqs)

    function new(string name = "async_fifo_empty_seqs");
        super.new(name);
    endfunction

    task body();
        trans_h = async_fifo_trans #(DATA_WIDTH) :: type_id :: create("trans_h");

        fork
            check_fifo_full();
        join_none

        do
        begin
            assert(trans_h.randomize() with {winc == 1; rinc == 0;});
            start_item(trans_h);
            finish_item(trans_h);
        end
        while(!fifo_became_full);

        fork
            check_fifo_empty();
        join_none
        
        do
        begin
            assert(trans_h.randomize() with {winc == 0; rinc == 1;});
            start_item(trans_h);
            finish_item(trans_h);
        end
        while(!fifo_became_empty);

        repeat(5)
        begin
            assert(trans_h.randomize() with {winc == 1; rinc == 0;});
            start_item(trans_h);
            finish_item(trans_h);
        end

        void'(uvm_hdl_force("async_fifo_top.wrst_n",0));
        void'(uvm_hdl_force("async_fifo_top.rrst_n",0));
        wait_for_wclk(5);
        wait_for_rclk(5);
        // void'(uvm_hdl_force("async_fifo_top.wrst_n",1));
        // void'(uvm_hdl_force("async_fifo_top.rrst_n",1));
        
        // repeat(5)
        // begin
        //     assert(trans_h.randomize() with {winc == 0; rinc == 1;});
        //     start_item(trans_h);
        //     finish_item(trans_h);
        // end
        
    endtask

endclass : async_fifo_empty_seqs