######################################################################
#
# File name : schk_tb_compile.do
# Created on: Mon Nov 18 15:17:40 +0800 2019
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -64 -incr -work xil_defaultlib  \
"../../../../project_4.srcs/sources_1/new/schk.v" \
"../../../../project_4.srcs/sim_1/new/schk_tb.v" \


# compile glbl module
vlog -work xil_defaultlib "glbl.v"

quit -force

