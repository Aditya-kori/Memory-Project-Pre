`define WIDTH 8
`define DEPTH 8
`define ADDR_WIDTH $clog2(`DEPTH)
`define NEW_COMP \
function new(string name="", uvm_component parent); \
	super.new(name,parent); \
endfunction
`define NEW_OBJ \
function new(string name=""); \
	super.new(name); \
endfunction
int num_matches;
int num_mis_matches;
