class async_fifo_b2b_write_read_test extends async_fifo_test;

    `uvm_component_utils(async_fifo_b2b_write_read_test)

    async_fifo_b2b_write_read_seqs seqs_h_tc3;

    function new(string name = "async_fifo_b2b_write_read_test", uvm_component parent = null);
        super.new(name, parent);
        sb_enable = 0;
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        begin
            seqs_h_tc3 = async_fifo_b2b_write_read_seqs #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("seqs_h_tc3", this);
            seqs_h_tc3.start(env_h.agent_h.seqr_h);
        end
        phase.drop_objection(this);
    endtask

endclass : async_fifo_b2b_write_read_test