`timescale 1ns/1ps

import async_fifo_pkg::*;

module async_fifo_top();

	mailbox #(transaction)mon2_sb;

	parameter real WCLK_FRQ = 10.00;					//Unit: MHz
	parameter real RCLK_FRQ = 6.00;					//Unit: MHz
	parameter real WCLK_T = ((1/WCLK_FRQ)*1000.00);
	parameter real RCLK_T = ((1/RCLK_FRQ)*1000.00);
	parameter DATA_WIDTH=8;
	parameter ADDR_WIDTH=4;
	
	bit wclk, rclk, wrst_n, rrst_n;
	
	async_fifo_base_test test_h;
	
	async_fifo_interface inf(.*);

	scoreboard sb_h;

    //Design top module instantiation
	asynch_fifo_dut DUT(.rdata(inf.rdata),
                        .wfull(inf.wfull),
                        .rempty(inf.rempty),
                        .wdata(inf.wdata),
                        .winc(inf.winc),
                        .wclk(wclk),
                        .wrst_n(wrst_n),
                        .rinc(inf.rinc),
                        .rclk(rclk),
                        .rrst_n(rrst_n));

    task reset();

        wrst_n = 0;
        rrst_n = 0;
        fork
            @(negedge wclk);
            @(negedge rclk);
        join
                    
        fork
            @(negedge wclk);
            @(negedge rclk);
        join
        wrst_n = 1;
        rrst_n = 1;
                    
    endtask
	
    initial
    begin
	    wclk = 0;
        $display("WCLK_T/2 = %.2f", WCLK_T);
		$display("RCLK_T/2 = %.2f", RCLK_T);
	    forever
		begin
			#((WCLK_T)/2) wclk = ~wclk;
		end
    end

    initial
    begin
	    rclk = 0;
	    forever
		begin
			#((RCLK_T)/2) rclk = ~rclk;
		end
    end

    initial
    begin
        reset();
	    //fifo_sb_h = new(mon2_sb,rfm2_sb);
	    test_h = new(inf);
	    test_h.build();
	    test_h.run();
	    #10000;
	    $finish;
    end	

    final
    begin
    // $display("-------------------------------------------------------");
    // $display("Time : %0t,  FIFO-Coverage = %0.2f %%",$time,fifo_sb_h.fifo_cvg.get_coverage());
    // $display("-------------------------------------------------------");
    end	

endmodule