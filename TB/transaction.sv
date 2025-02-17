class transaction #(parameter DATA_WIDTH = 8);

	randc logic [DATA_WIDTH-1:0] wdata;
	rand logic winc;
	rand logic rinc;
	
	constraint wdata_c {wdata inside {[1:DATA_WIDTH-1]};}
	constraint winc_rinc_c {{winc, rinc} != 2'b00;}
		
	function void print(string s = "trans_h");
		$display("%s, Inputs: wdata = %h, winc = %b, rinc = %b", s, wdata, winc, rinc);
	endfunction
	
endclass