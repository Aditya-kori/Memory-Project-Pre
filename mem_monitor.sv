class mem_monitor extends uvm_monitor;
uvm_analysis_port#(mem_tx) analysis_port;
mem_tx tx;
virtual mem_intrf vif;
	`uvm_component_utils(mem_monitor)
	`NEW_COMP
	
	function void build();
		uvm_config_db#(virtual mem_intrf)::get(this,"","vif",vif);
		analysis_port = new("analysis_port", this);
		tx = new("tx");
	endfunction

	task run();
		forever begin
			@(vif.mon_cb);
			if(vif.mon_cb.valid==1 && vif.ready==1) begin
				tx.wr_rd = vif.mon_cb.wr_rd;
				tx.addr = vif.mon_cb.addr;
				tx.wdata = vif.mon_cb.wdata;
				if(tx.wr_rd == 0) begin
					@(vif.mon_cb);
					tx.rdata = vif.mon_cb.rdata;
				end
				`uvm_info("MON","Tx of monitor",UVM_LOW);
				tx.print();
				analysis_port.write(tx);
			end
		end
	endtask
endclass
