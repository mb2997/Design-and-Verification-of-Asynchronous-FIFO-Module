import async_fifo_pkg::*;

module async_fifo_top();

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    parameter CYCLE = 10;
    real WCLK_FRQ = 100.00; // Unit: MHz
    real RCLK_FRQ = 80.00; // Unit: MHz
    real WCLK_T = ((1 / WCLK_FRQ) * 1000.00);
    real RCLK_T = ((1 / RCLK_FRQ) * 1000.00);
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    logic wclk, rclk, wrst_n, rrst_n;

    bit disable_write_at_full = 0;
    bit disable_write_at_empty = 0;

    async_fifo_if inf(.*);
    async_fifo_test #(DATA_WIDTH, ADDR_WIDTH) test_h;

    // Design top module instantiation
    asynch_fifo_dut #(DATA_WIDTH, ADDR_WIDTH) DUT (
        .rdata(inf.rdata),
        .wfull(inf.wfull),
        .rempty(inf.rempty),
        .wdata(inf.wdata),
        .winc(inf.winc),
        .wclk(wclk),
        .wrst_n(wrst_n),
        .rinc(inf.rinc),
        .rclk(rclk),
        .rrst_n(rrst_n)
    );

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

        foreach(DUT.FIFOMEM.fifo[i])
        begin
            if(DUT.FIFOMEM.fifo[i])
                `uvm_error("RESET_FAILED", $sformatf("FIFO is not getting reset at fifo[%0d]", i))
        end
        `uvm_info("RESET_DONE", "RESET task executed", UVM_MEDIUM)
        
        wrst_n = 1;
        rrst_n = 1;

    endtask

    // Clock generation
    initial begin
        wclk = 0;
        $display("WCLK_T/2 = %.2f", WCLK_T);
        $display("RCLK_T/2 = %.2f", RCLK_T);
        forever #((WCLK_T) / 2) wclk = ~wclk;
    end

    initial begin
        rclk = 0;
        forever #((RCLK_T) / 2) rclk = ~rclk;
    end

    // Test execution
    initial begin
        // test_h = async_fifo_test :: type_id :: create("test_h", null);
        // test_h.set_report_verbosity_level(UVM_NONE);
        if($test$plusargs("WRITE_FAST"))
        begin
            WCLK_FRQ = $urandom_range(100, 200);
            RCLK_FRQ = $urandom_range(50, 100);
        end
        if($test$plusargs("READ_FAST"))
        begin
            RCLK_FRQ = $urandom_range(50, 100);
            WCLK_FRQ = $urandom_range(100,200);
        end

        fork
            reset();
        join_none

        uvm_config_db#(virtual async_fifo_if) :: set(null, "*", "vif", inf);
        
        if($test$plusargs("MID_RESET"))
		begin
            fork
                run_test("async_fifo_full_test");
            join_none
            repeat(6)
                @(negedge wclk);
            reset();
            repeat(11)
                @(negedge wclk);
            reset();
            $display("*************************************************************************");
            $display($time, "\tRESET Applied");
            $display("*************************************************************************");
		end
        else
            run_test();
    end

    // Assertions
    property p_wreset_check;
        @(posedge wclk)
        $fell(wrst_n) |=> (!inf.wfull);
    endproperty
    assert property(p_wreset_check) else $error("Fifo Full should be deasserted after reset");

    property p_rreset_check;
        @(posedge rclk)
        $fell(rrst_n) |=> (inf.rempty && !inf.rdata);
    endproperty
    assert property(p_rreset_check) else $error("Fifo Empty should be asserted after reset");

    property p_fifo_full_vs_empty;
        @(posedge rclk)
        inf.wfull |-> !inf.rempty;
    endproperty
    assert property(p_fifo_full_vs_empty) else $error("Fifo Empty should be deasserted when FIFO is Full");

    property p_fifo_empty_vs_full;
        @(posedge wclk)
        inf.rempty |-> !inf.wfull;
    endproperty
    assert property(p_fifo_empty_vs_full) else $error("Fifo Full should be deasserted when FIFO is Empty");

    property p_fifoflags_wfull;
        @(posedge wclk)
        inf.rinc |-> ##[3:5] !inf.wfull;
    endproperty
    assert property(p_fifoflags_wfull) else $error("After a FIFO read, FIFO cannot be full");

    property p_fifoflags_rempty;
        @(posedge rclk) disable iff(!rrst_n)
        inf.winc |-> ##[3:5] !inf.rempty;
    endproperty
    assert property(p_fifoflags_rempty) else $error("After a FIFO write, FIFO cannot be empty");

    property p_fifoflags_full;
        @(posedge wclk) disable iff(!wrst_n || disable_write_at_full)
        inf.winc && inf.wfull |=> !inf.winc;
    endproperty
    assert property(p_fifoflags_full) else $error("If FIFO is full, it cannot be written to");

    property p_fifoflags_empty;
        @(posedge rclk) disable iff(!rrst_n || disable_write_at_empty)
        inf.rinc && inf.rempty |=> !inf.rinc;
    endproperty
    assert property(p_fifoflags_empty) else $error("If FIFO is empty, it cannot be read");

    // // Final block to display FIFO contents
    // final begin
    //     foreach (DUT.FIFOMEM.fifo[i]) begin
    //         $display("async_fifo[%0d] = %0d", i, DUT.FIFOMEM.fifo[i]);
    //     end
    // end

endmodule : async_fifo_top
