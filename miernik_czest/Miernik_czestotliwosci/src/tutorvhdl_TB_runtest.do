SetActiveLib -work
comp -include "$dsn\src\Core.vhd" 
comp -include "$dsn\src\TestBench\Core_TB.vhd" 
asim +access +r TESTBENCH_FOR_Core 
wave 		   

wave -noreg fx
wave -noreg fautomat
wave -noreg CLR
wave -noreg CE			
wave -noreg Yautomat
wave -noreg CLK
wave -noreg Y

run 6000.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\tutorvhdl_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_tutorvhdl 
