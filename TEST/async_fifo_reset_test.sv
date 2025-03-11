class async_fifo_reset_test extends async_fifo_test;

    `uvm_component_utils(async_fifo_reset_test)

    async_fifo_reset_seqs seqs_h_tc6;

    function new(string name = "async_fifo_reset_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        fork
            begin
                seqs_h_tc6 = async_fifo_reset_seqs #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("seqs_h_tc6", this);
                seqs_h_tc6.start(env_h.agent_h.seqr_h);
            end
            begin
                #100;
                sb_enable = 0;
            end
        join
        phase.drop_objection(this);
    endtask

endclass : async_fifo_reset_test