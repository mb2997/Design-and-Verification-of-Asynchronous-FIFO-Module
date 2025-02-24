class driver extends uvm_driver #(seq_item);
	`uvm_component_utils(driver);
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	virtual async_fifo_interface vif;
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!(uvm_config_db#(virtual async_fifo_interface)::get(this,"*","vif",vif)))
			`uvm_error("async_fifo","Failed to get vif from config DB!");
	endfunction
	
	task run_phase(uvm_phase phase);
		seq_item item;
		super.run_phase(phase);
		
		forever begin
			`uvm_info("Data from Sequencer",UVM_HIGH);
			seq_item_port.get_next_item(item);
			drive_item(item);
			seq_item_port.item_done();
		end	
	endtask
	
	task drive_item(seq_item item);
		fork
			begin
				@(negedge vif.wclk);
				vif.wdata <= item.wdata;
				vif.winc <= item.winc;
			end
			
			begin
				@(negedge vif.rclk);
				vif.rinc <= item.rinc;
			end
		join_any
	endtask
	
endclass