SetActiveLib -work
comp -include "$dsn\src\top.bde" 
comp -include "$dsn\src\TestBench\miernik_tb.vhd" 
asim +access +r TESTBENCH_FOR_top 
wave 		   
	

wave -noreg CLK
wave -noreg CLR
wave -noreg LE
wave -noreg fx
wave -noreg Ylatch1 	  
wave -noreg Ylatch2 
wave -noreg Ylatch3   
wave -noreg Y1	 
wave -noreg Y2
wave -noreg Y3
wave -noreg GATE	
wave -noreg GATEIN
wave -noreg GATEOUT
run 1000.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\tutorvhdl_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_tutorvhdl 
