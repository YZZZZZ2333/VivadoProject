######################################################################
#
# File name : schk_tb_simulate.do
# Created on: Tue Nov 12 20:32:40 +0800 2019
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.schk_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {schk_tb_wave.do}

view wave
view structure
view signals

do {schk_tb.udo}

run 1000ns
