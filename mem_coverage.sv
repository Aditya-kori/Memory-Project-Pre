class mem_coverage extends uvm_subscriber#(mem_tx);
mem_tx tx;
	`uvm_component_utils(mem_coverage)

	covergroup mem_cg;
		WR_RD : coverpoint tx.wr_rd{
			bins WRITE = {1'b1};
			bins READ = {1'b0};
		}
		ADDR : coverpoint tx.addr{
			option.auto_bin_max = 8;
		}
	endgroup

	function new(string name="", uvm_component parent);
		super.new(name, parent);
		mem_cg = new();
	endfunction
	
	function void build();
		tx = new("tx");
	endfunction

	function void write(mem_tx t);
		$cast(tx,t);
		`uvm_info("COV","Tx of cov",UVM_LOW);
		tx.print();
		mem_cg.sample();
	endfunction

endclass
