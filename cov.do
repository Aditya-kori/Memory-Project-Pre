vlog top.sv \
+incdir+C:/uvm-1.2/uvm-1.2/src\
+define+UVM_NO_DPI

vopt top +cover=fcbest -o test_n_wr_rd
vsim \
-coverage test_n_wr_rd -assertdebug
coverage save -onexit test_n_wr_rd.ucdb
#do exclusion.do
add wave -r sim:/top/pif/*
run -all

