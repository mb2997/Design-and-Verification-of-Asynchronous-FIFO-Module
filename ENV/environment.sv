class environment extends uvm_env;
	`uvm_component_utils(environment);
	
	agent agent_h;
	scoreboard scoreboard_h;
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent_h = agent::type_id::create("agent_h",this);
		scoreboard_h = scoreboard::type_id::create("scoreboard_h",this);
	endfunction
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		agent_h.monitor_h.trans_port.connect(scoreboard_h.analysis_export);
	endfunction
	
endclass