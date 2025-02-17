class async_fifo_base_test;

    environment env_h;
    async_fifo_write_read_gen async_fifo_write_read_gen_h;
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
			async_fifo_write_read_gen_h = new(env_h.gen2drv);
		    env_h.gen_h = async_fifo_write_read_gen_h;
		end

		if($test$plusargs("FIFO_FULL_TC"))
		begin
			
		end

		if($test$plusargs("FIFO_EMPTY_TC"))
		begin
			// fifo_empty_tc = new(fifo_env_h.gen2_drv);
			// fifo_env_h.fifo_gen_h = fifo_empty_tc;
		end

        env_h.run();
        
    endtask
    

endclass