class async_fifo_test #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends uvm_test;

    bit clk;
    //Factory registration
    `uvm_component_param_utils(async_fifo_test)

    async_fifo_env env_h;
    async_fifo_seqs seqs_h;

    //virtual interface - Taking to access rst bit from top module and apply reset
    virtual async_fifo_if vif;

    //Function new - constructor
    function new(string name = "async_fifo_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);
        
        seqs_h = async_fifo_seqs #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("seqs_h");
        env_h = async_fifo_env #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("async_fifo_env", this);

        if(!uvm_config_db #(virtual async_fifo_if) :: get(this," ","vif",vif))
            `uvm_fatal("async_fifo_TEST : ", $sformatf("Can't able to get vif... Have you set it ??"))
        
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
        get_vif_in_pkg();
    endfunction

    task run_phase(uvm_phase phase);

       
        phase.raise_objection(this);

            seqs_h.start(env_h.agent_h.seqr_h);        

        phase.drop_objection(this);
    endtask 

endclass : async_fifo_test