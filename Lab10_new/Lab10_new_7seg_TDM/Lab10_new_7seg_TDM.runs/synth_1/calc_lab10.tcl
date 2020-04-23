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
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.cache/wt} [current_project]
set_property parent.project_path {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo {c:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/Add3.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/BCDmod11.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/alu.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/an_decode.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/counter.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/mux2.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/mux4.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/register.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/sseg4_TDM.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/sseg_decoder.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/top_lab_9.sv}
  {C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/Lab10_new_7seg_TDM.srcs/sources_1/new/calc_lab10.sv}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/btnC.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/btnC.xdc}}]

read_xdc {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/btnD.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/btnD.xdc}}]

read_xdc {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/btnU.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/btnU.xdc}}]

read_xdc {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/clock.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/clock.xdc}}]

read_xdc {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/led.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/led.xdc}}]

read_xdc {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/sseg.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/sseg.xdc}}]

read_xdc {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/switches.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/maken/Documents/ELC Lab 2137/DL202010_meyers/Lab10_new/Lab10_new_7seg_TDM/switches.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top calc_lab10 -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef calc_lab10.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file calc_lab10_utilization_synth.rpt -pb calc_lab10_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]