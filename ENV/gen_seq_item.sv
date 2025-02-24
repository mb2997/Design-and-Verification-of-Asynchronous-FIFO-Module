class gen_seq_item extends uvm_sequence #(seq_item);
	`uvm_object_utils(gen_seq_item);
	seq_item item;
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	virtual task body();
		item = seq_item::type_id::create("item");
		repeat(no_of_trans)
		begin
			start_item(item);
			assert(item.randomize());
			finish_item(item);
			`uvm_info("sequence","ADD SOME DETAILS",UVM_HIGH);
		end
		`uvm_info("Sequence generation complete","ADD SOME DETAILS - # of transactions",UVM_LOW);
	endtask
	
endclass