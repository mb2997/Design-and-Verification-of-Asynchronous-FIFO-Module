class transaction #(parameter DATA_WIDTH = 8);

	randc logic [DATA_WIDTH-1:0] wdata;
	rand logic winc;
	rand logic rinc;

	//Local variables
	logic [DATA_WIDTH-1:0] rdata;
	logic rempty;
	logic wfull;
	
	//constraint wdata_c {wdata inside {[1:DATA_WIDTH-1]};}
	constraint winc_rinc_c {{winc, rinc} != 2'b00;}
	constraint wdata_dis_c {(rinc == 1) -> (wdata == 0);}
		
	function void print(string s = "trans_h");
		$display("%s, Inputs: wdata = %0d, rdata = %0d, winc = %b, rinc = %b", s, wdata, rdata, winc, rinc);
	endfunction
	
endclass