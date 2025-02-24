class agent extends uvm_agent;
	`uvm_component_utils(agent);
	
	sequencer #(seq_item) sequencer_h;
	driver driver_h;
	monitor monitor_h;
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (get_is_active()== UVM_ACTIVE) begin
		sequencer_h = sequencer#(seq_item)::type_id::create("sequencer_h",this);
		driver_h = driver::type_id::create("driver_h",this);
		end
		monitor_h = monitor::type_id::create("monitor_h",this);
	endfunction
	
	function void connect_phase(uvm_phase phase);
		driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
	endfunction
endclass