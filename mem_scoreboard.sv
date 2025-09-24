class mem_scoreboard extends uvm_scoreboard;
mem_tx tx;
int mem[*];
uvm_analysis_imp#(mem_tx, mem_scoreboard) analysis_imp;
	`uvm_component_utils(mem_scoreboard)
	`NEW_COMP

	function void build();
		analysis_imp = new("analysis_imp", this);
	endfunction

	virtual function write(mem_tx t);
		$cast(tx, t);
		if(tx.wr_rd) mem[tx.addr] = tx.wdata;
		else begin
			if(mem[tx.addr] == tx.rdata) num_matches++;
			else num_mis_matches++;
		end
	endfunction
endclass
