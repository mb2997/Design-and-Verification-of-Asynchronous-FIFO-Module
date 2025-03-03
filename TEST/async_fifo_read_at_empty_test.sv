class async_fifo_read_at_empty_test extends async_fifo_test;

    `uvm_component_utils(async_fifo_read_at_empty_test)

    async_fifo_read_at_empty_seqs seqs_h_tc6;

    function new(string name = "async_fifo_read_at_empty_test", uvm_component parent = null);
        super.new(name, parent);
        // sb_enable = 0;
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        begin
            seqs_h_tc6 = async_fifo_read_at_empty_seqs #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("seqs_h_tc6", this);
            seqs_h_tc6.start(env_h.agent_h.seqr_h);
        end
        phase.drop_objection(this);
    endtask

endclass : async_fifo_read_at_empty_test