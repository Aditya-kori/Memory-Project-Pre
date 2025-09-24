class mem_env extends uvm_env;
	mem_agent agt;
	mem_scoreboard sbd;
	`uvm_component_utils(mem_env)
	`NEW_COMP

	function void build_phase(uvm_phase phase);
		agt = mem_agent :: type_id :: create("agt",this);
		sbd = mem_scoreboard :: type_id :: create("sbd",this);
	endfunction

	function void connect();
		agt.mon.analysis_port.connect(sbd.analysis_imp);
	endfunction
endclass

