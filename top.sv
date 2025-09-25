`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "mem_common.sv"
`include "mem_tx.sv"
`include "memory.v"
`include "mem_assert.sv"
`include "mem_intrf.sv"
`include "mem_driver.sv"
`include "mem_monitor.sv"
`include "mem_coverage.sv"
`include "mem_seq_lib.sv"
`include "mem_sequencer.sv"
`include "mem_scoreboard.sv"
`include "mem_agent.sv"
`include "mem_env.sv"
`include "mem_test.sv"
module top;
	bit clk,rst;
	mem_intrf pif(clk,rst);
memory dut(
			.clk(pif.clk),
			.rst(pif.rst),
			.wr_rd(pif.wr_rd),
			.addr(pif.addr),
			.wdata(pif.wdata),
			.rdata(pif.rdata),
			.valid(pif.valid),
			.ready(pif.ready)
			);

mem_assert uut(
				.clk(pif.clk), 
				.rst(pif.rst), 
				.wr_rd(pif.wr_rd), 
				.addr(pif.addr),
				.wdata(pif.wdata), 
				.rdata(pif.rdata), 
				.valid(pif.valid), 
				.ready(pif.ready)
				);
	always #5 clk=~clk;
	initial begin
		uvm_config_db#(virtual mem_intrf)::set(null,"*","vif",pif);
	end
	initial begin
		rst=1;	
		clk=0;
		repeat(2)@(posedge clk);
		rst=0;
	end
	initial begin
		run_test("test_n_wr_rd");
	end
endmodule

