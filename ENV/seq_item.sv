class seq_item extends uvm_sequence_item;
	`uvm_object_utils(seq_item);
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	//DATA_WIDTH ??
	
	randc logic [DATA_WIDTH-1:0] wdata;
	rand logic winc;
	rand logic rinc;

	//Local variables
	logic [DATA_WIDTH-1:0] rdata;
	logic rempty;
	logic wfull;
	
	//constraint wdata_c {wdata inside {[1:DATA_WIDTH-1]};}
	constraint winc_rinc_c {{winc, rinc} != 2'b00;}
	constraint wdata_dis_c {(rinc == 1 && winc == 0) -> (wdata == 0);}
	//constraint wdata_weight {wdata dist {0:=20, ((2**DATA_WIDTH)-1):=20, [1:(2**DATA_WIDTH)-1]:/60};}
	
endclass