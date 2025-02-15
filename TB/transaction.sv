class transaction #(parameter DATA_WIDTH = 8);
	rand logic [DATA_WIDTH-1:0] wdata;
	rand logic winc;
	rand logic rinc;
	
	constraint c1 { 
		wdata inside {[1:DATA_WIDTH-1]};}
		
	function void print();
		$display("Inputs: wdata = %h, winc = %b, rinc = %b",wdata,winc,rinc);
	endfunction
	
endclass
