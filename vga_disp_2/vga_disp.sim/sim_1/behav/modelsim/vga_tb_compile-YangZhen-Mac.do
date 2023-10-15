######################################################################
#
# File name : vga_tb_compile.do
# Created on: Tue Nov 12 19:51:05 +0800 2019
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -64 -incr -work xil_defaultlib  \
"../../../../vga_disp.srcs/sources_1/new/vga_disp.v" \
"../../../../vga_disp.srcs/sim_1/new/vga_disp_tb.v" \


# compile glbl module
vlog -work xil_defaultlib "glbl.v"

quit -force

