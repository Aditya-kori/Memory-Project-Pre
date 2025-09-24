class mem_agent extends uvm_agent;
	mem_sequencer sqr;
	mem_driver drv;
	mem_monitor mon;
	mem_coverage cov;

	`uvm_component_utils(mem_agent)
	`NEW_COMP
	
	function void build_phase(uvm_phase phase);
		sqr = mem_sequencer :: type_id :: create("sqr",this);
		drv = mem_driver 	:: type_id :: create("drv",this);
		mon = mem_monitor 	:: type_id :: create("mon",this);
		cov = mem_coverage 	:: type_id :: create("cov",this);
	endfunction

	function void connect();
		drv.seq_item_port.connect(sqr.seq_item_export);
		mon.analysis_port.connect(cov.analysis_export);
	endfunction
endclass

