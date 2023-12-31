# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.cache/wt [current_project]
set_property parent.project_path C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/music.coe
read_verilog -library xil_defaultlib -sv {
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/new/SPEAKER.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/char8x16_rom.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/core_alu.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/core_bus_wrapper.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/core_id_stage.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/core_instr_bus_adapter.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/core_regfile.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/core_top.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/dual_read_port_ram_32x32.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/instr_rom.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/isp_uart.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/naive_bus.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/naive_bus_router.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/ram.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/ram128B.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/ram_bus_wrapper.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/soc_top.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/uart_rx.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/uart_tx_line.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/user_uart_tx.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/vga_char_86x32.sv
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/imports/RTL/video_ram.sv
}
read_verilog -library xil_defaultlib {
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/new/F_CODE.v
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/new/SPKER.v
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/new/pout_seg.v
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/new/seg.v
  C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/sources_1/new/Artix_Soc_Top.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/constrs_1/new/ARTIX7.xdc
set_property used_in_implementation false [get_files C:/Users/YangZhen/Documents/EDA/USTC-RVSoC-master/USTC-RVSoC-master/hardware/Vivado/ATIX7/RISC-V/RISC-V.srcs/constrs_1/new/ARTIX7.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Artix_SoC_top -part xc7a35tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Artix_SoC_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Artix_SoC_top_utilization_synth.rpt -pb Artix_SoC_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
