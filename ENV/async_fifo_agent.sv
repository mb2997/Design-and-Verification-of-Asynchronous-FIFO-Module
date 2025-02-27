class async_fifo_agent #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends uvm_agent;

	`uvm_component_utils(async_fifo_agent)

	virtual async_fifo_if vif;

	async_fifo_seqr seqr_h;
	async_fifo_drv drv_h;
	async_fifo_mon mon_h;

	function new(string name = "async_fifo_agent", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		
		super.build_phase(phase);

		if(!uvm_config_db #(virtual async_fifo_if) :: get(this,"","vif",vif))
		begin
			`uvm_fatal("WRITE AGENT : ",$sformatf("Can't able to get async_fifo_vif... Have you set it ??"))
		end

		mon_h = async_fifo_mon #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("mon_h",this);
		drv_h = async_fifo_drv #(DATA_WIDTH, ADDR_WIDTH) :: type_id :: create("drv_h",this);
		seqr_h = async_fifo_seqr :: type_id :: create("seqr_h",this);	

	endfunction

	function void connect_phase(uvm_phase phase);
		drv_h.seq_item_port.connect(seqr_h.seq_item_export);
		drv_h.vif = vif;
		mon_h.vif = vif;
	endfunction

endclass : async_fifo_agent