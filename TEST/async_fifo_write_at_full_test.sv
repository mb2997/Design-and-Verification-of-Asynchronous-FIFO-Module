class async_fifo_write_at_full_test extends async_fifo_test;

    `uvm_component_utils(async_fifo_write_at_full_test)

    async_fifo_write_at_full_seqs seqs_h_tc4;

    function new(string name = "async_fifo_write_at_full_test", uvm_component parent = null);
        super.new(name, parent);
        // sb_enable = 0;
    endfunction

    task run_phase(uvm_phase phase);
        void'(uvm_hdl_force("async_fifo_top.disable_write_at_full",1));
        phase.raise_objection(this);
        begin
            seqs_h_tc4 = async_fifo_write_at_full_seqs #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("seqs_h_tc4", this);
            seqs_h_tc4.start(env_h.agent_h.seqr_h);
        end
        phase.drop_objection(this);
    endtask

endclass : async_fifo_write_at_full_test