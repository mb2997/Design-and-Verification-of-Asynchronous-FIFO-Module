class sequencer extends uvm_sequencer#(seq_item);
	`uvm_sequencer_utils(sequencer);
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
endclass