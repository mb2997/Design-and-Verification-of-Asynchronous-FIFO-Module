class async_fifo_env #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends uvm_env;

    `uvm_component_utils(async_fifo_env)

    async_fifo_agent agent_h;
    async_fifo_sb sb_h;

    //function new - constructor
    function new(string name = "async_fifo_env", uvm_component parent);
        super.new(name, parent);
    endfunction

    //Build phase we are creating object for write and read agent and scoreboard
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent_h = async_fifo_agent #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("agent_h",this);
        sb_h = async_fifo_sb #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("sb_h",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        agent_h.mon_h.wmon2sb.connect(sb_h.wmon2sb_af.analysis_export);
        agent_h.mon_h.rmon2sb.connect(sb_h.rmon2sb_af.analysis_export);
    endfunction

endclass : async_fifo_env