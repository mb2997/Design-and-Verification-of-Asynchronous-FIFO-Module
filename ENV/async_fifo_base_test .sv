class async_fifo_base_test extends uvm_test;
	`uvm_component_utils(async_fifo_base_test);
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	environment env_h;
	virtual async_fifo_interface vif;
	gen_seq_item seq_item_h;
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env_h = environment::type_id::create("env_h",this);
		if(!(uvm_config_db#(virtual async_fifo_interface)::get(this,"*","vif",vif)))
			`uvm_error("async_fifo","Failed to get vif from config DB!");
		uvm_config_db#(virtual async_fifo_interface)::set(this,"env_h.agent_h.*","vif",vif)
		seq_item_h = gen_seq_item::type_id::create("seq_item_h");
	endfunction
	
	function void run_phase(uvm_phase phase);
		phase.raise_objection(this);
		//tests
		phase.drop_objection(this);	
	endfunction
	
endclass