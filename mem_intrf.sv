interface mem_intrf(input bit clk,rst);
	bit wr_rd,valid,ready;
	bit [`ADDR_WIDTH-1:0]addr;
	bit [`WIDTH-1:0]wdata;
	bit [`WIDTH-1:0]rdata;

	clocking drv_cb @(posedge clk);
		default input #0 output #1;
			input rdata,ready;
			output valid,wr_rd,addr,wdata;
	endclocking

	clocking mon_cb@(posedge clk);
		default input #1;
			input rdata, ready, valid, wr_rd, addr, wdata;
	endclocking
endinterface
