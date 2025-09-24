class mem_driver extends uvm_driver#(mem_tx);
	`uvm_component_utils(mem_driver)
	`NEW_COMP
	virtual mem_intrf vif;
	function void build_phase(uvm_phase phase);
		uvm_config_db#(virtual mem_intrf)::get(this,"","vif",vif);
	endfunction 
	task run();
		forever begin
			seq_item_port.get_next_item(req);
			drive_tx(req);
			req.print();
			seq_item_port.item_done();
		end
	endtask

	task drive_tx(mem_tx tx);
		@(vif.drv_cb);
		vif.drv_cb.wr_rd<=tx.wr_rd;
		vif.drv_cb.addr	<=tx.addr;
		if(tx.wr_rd==1) vif.drv_cb.wdata<=tx.wdata;
		else vif.drv_cb.wdata<=0;
		vif.drv_cb.valid<=1;
		wait(vif.drv_cb.ready==1);
		if(tx.wr_rd==0) begin
			@(vif.drv_cb)
			tx.rdata=vif.drv_cb.rdata;
		end
		@(vif.drv_cb);
		vif.drv_cb.valid<=0;
		vif.drv_cb.wr_rd<=0;
		vif.drv_cb.addr<=0;
		vif.drv_cb.wdata<=0;
	endtask
endclass
