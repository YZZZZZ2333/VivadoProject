######################################################################
#
# File name : cnt10_simulate.do
# Created on: Tue Oct 22 18:54:40 +0800 2019
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.cnt10 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {cnt10_wave.do}

view wave
view structure
view signals

do {cnt10.udo}

run 1000ns