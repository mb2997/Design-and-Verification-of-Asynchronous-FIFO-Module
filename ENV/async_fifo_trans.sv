class async_fifo_trans #(parameter DATA_WIDTH = 8) extends uvm_sequence_item;

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

    `uvm_object_utils_begin(async_fifo_trans)
        `uvm_field_int(wdata, UVM_ALL_ON | UVM_DEC)
        `uvm_field_int(winc, UVM_ALL_ON | UVM_DEC)
        `uvm_field_int(rinc, UVM_ALL_ON | UVM_DEC)
        `uvm_field_int(rdata, UVM_ALL_ON | UVM_DEC)
        `uvm_field_int(rempty, UVM_ALL_ON | UVM_DEC)
        `uvm_field_int(wfull, UVM_ALL_ON | UVM_DEC)
    `uvm_object_utils_end

    //new constructor
    function new(string name = "async_fifo_trans");
        super.new(name);
    endfunction

endclass : async_fifo_trans