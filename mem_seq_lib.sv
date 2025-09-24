class base_seq extends uvm_sequence#(mem_tx);
mem_tx temp,txQ[$];
	`uvm_object_utils(base_seq)
	`NEW_OBJ

	task pre_body();

	endtask
	task post_body();

	endtask
endclass

class mem_1wr extends base_seq;
	`uvm_object_utils(mem_1wr)
	`NEW_OBJ

	task body();
		`uvm_do_with(req,{req.wr_rd==1;})	
	endtask
endclass
class wr_rd_seq extends base_seq;
	`uvm_object_utils(wr_rd_seq)
	`NEW_OBJ

	task body();
		`uvm_do_with(req,{req.wr_rd==1;})
		temp = req;
		`uvm_do_with(req,{req.wr_rd==0;req.addr==temp.addr;req.wdata==0;})
	endtask
endclass
class n_wr_rd_seq extends base_seq;
rand int count;
	`uvm_object_utils(n_wr_rd_seq)
	`NEW_OBJ

	task body();
		repeat(count) begin
		`uvm_do_with(req,{req.wr_rd==1;})
		txQ.push_back(req);
		end
		repeat(count) begin
		temp = txQ.pop_front();
		`uvm_do_with(req,{req.wr_rd==0;req.addr==temp.addr;req.wdata==0;})
		end
	endtask
endclass
