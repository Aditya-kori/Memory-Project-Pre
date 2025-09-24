class base_test extends uvm_test;
	mem_env env;
	`uvm_component_utils(base_test)
	`NEW_COMP

	//function new(string name="", uvm_component parent);
	//	super.new(name,parent);
	//endfunction

	function void build_phase(uvm_phase phase);
		env = mem_env :: type_id :: create("env",this);
	endfunction
	
	function void end_of_elaboration();
		uvm_top.print_topology();
	endfunction

	function void report();
		if(num_matches!=0 && num_mis_matches == 0) `uvm_info("STATUS","test passed", UVM_LOW)
		else `uvm_error("STATUS", "test failed")
	endfunction

endclass
class test_1wr extends base_test;
	`uvm_component_utils(test_1wr)
	`NEW_COMP
	mem_1wr wr_seq;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		wr_seq = mem_1wr :: type_id :: create("wr_seq",this);
	endfunction
	
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,100);
		wr_seq.start(env.agt.sqr);
		phase.drop_objection(this);
	endtask

endclass

class test_wr_rd extends base_test;
	`uvm_component_utils(test_wr_rd)
	`NEW_COMP
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	task run_phase(uvm_phase phase);
	wr_rd_seq wr_rd;
		wr_rd= wr_rd_seq :: type_id :: create("wr_rd",this);
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,100);
		wr_rd.start(env.agt.sqr);
		phase.drop_objection(this);
	endtask
endclass

class test_n_wr_rd extends base_test;
n_wr_rd_seq wr_rd;
	`uvm_component_utils(test_n_wr_rd)
	`NEW_COMP

	task run_phase(uvm_phase phase);
		wr_rd= n_wr_rd_seq :: type_id :: create("wr_rd",this);
		wr_rd.count = 3;
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,100);
		wr_rd.start(env.agt.sqr);
		phase.drop_objection(this);
	endtask
endclass
