######################################################################
#
# File name : pc_tb_compile.do
# Created on: Sat Dec 07 13:57:06 +0800 2019
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -64 -incr -work xil_defaultlib  \
"../../../../project_5.srcs/sources_1/new/main.v" \
"../../../../project_5.srcs/sim_1/new/main_tb.v" \


# compile glbl module
vlog -work xil_defaultlib "glbl.v"

quit -force
