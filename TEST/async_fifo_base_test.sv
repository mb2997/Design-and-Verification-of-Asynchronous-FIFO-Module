class async_fifo_base_test #(parameter DATA_WIDTH=8, ADDR_WIDTH=4);

    environment env_h;

    //Test generator instantiations
    async_fifo_write_read_test #(DATA_WIDTH, ADDR_WIDTH) async_fifo_write_read_test_h;
    async_fifo_write_full_test #(DATA_WIDTH, ADDR_WIDTH) async_fifo_write_full_test_h;
    async_fifo_read_empty_test #(DATA_WIDTH, ADDR_WIDTH) async_fifo_read_empty_test_h;
    async_fifo_b2b_write_read_test #(DATA_WIDTH, ADDR_WIDTH) async_fifo_b2b_write_read_test_h;

    //Interface instantiation
    virtual async_fifo_interface vif;

    function new(virtual async_fifo_interface vif);
        this.vif = vif;
    endfunction

    task build;
        env_h = new(vif);
        env_h.build();
    endtask

    task run();

        if($test$plusargs("ASYNC_FIFO_WRITE_READ_TEST"))
		begin
            $display("*************************************************************************");
            $display("\t\tASYNC_FIFO_WRITE_READ_TEST is Running");
            $display("*************************************************************************");
			async_fifo_write_read_test_h = new(env_h.gen2drv);
		    env_h.gen_h = async_fifo_write_read_test_h;
		end

		if($test$plusargs("ASYNC_FIFO_WRITE_FULL_TEST"))
		begin
            $display("*************************************************************************");
            $display("\tASYNC_FIFO_WRITE_FULL_TEST is Running");
            $display("*************************************************************************");
			async_fifo_write_full_test_h = new(env_h.gen2drv);
		    env_h.gen_h = async_fifo_write_full_test_h;
		end

		if($test$plusargs("ASYNC_FIFO_READ_EMPTY_TEST"))
		begin
            $display("*************************************************************************");
            $display("\tASYNC_FIFO_READ_EMPTY_TEST is Running");
            $display("*************************************************************************");
			async_fifo_read_empty_test_h = new(env_h.gen2drv);
		    env_h.gen_h = async_fifo_read_empty_test_h;
		end

		if($test$plusargs("ASYNC_FIFO_B2B_WRITE_READ_TEST"))
		begin
            $display("*************************************************************************");
            $display("\tASYNC_FIFO_B2B_WRITE_READ_TEST is Running");
            $display("*************************************************************************");
			async_fifo_b2b_write_read_test_h = new(env_h.gen2drv);
		    env_h.gen_h = async_fifo_b2b_write_read_test_h;
		end

        env_h.run();
        
    endtask
    

endclass