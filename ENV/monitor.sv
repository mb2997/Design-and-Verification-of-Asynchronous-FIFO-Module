class monitor extends uvm_monitor;
	`uvm_component_utils(monitor);
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	uvm_analysis_port #(seq_item) monitor_ap;
	virtual async_fifo_interface vif;
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!(uvm_config_db#(virtual async_fifo_interface)::get(this,"*","vif",vif)))
			`uvm_error("async_fifo","Failed to get vif from config DB!");
		monitor_ap = new("monitor_ap",this);	
	endfunction
	
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq_item item;
		item = seq_item::type_id::create("item");
		forever begin
			fork
				begin
					@(posedge vif.wclk);
					item.wdata = vif.wdata;
					item.wfull = vif.wfull;
					item.winc = vif.winc;
					monitor_ap.write(item);
				end

				begin
					@(negedge vif.rclk);
					item.rdata = vif.rdata;
					item.rempty = vif.rempty;
					item.rinc = vif.rinc;
					monitor_ap.write(item);
				end

			join_any
		end
	endtask
endclass 