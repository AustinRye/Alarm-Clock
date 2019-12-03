#
# Vivado (TM) v2016.3 (64-bit)
#
# build.tcl: Tcl script for re-creating project 'alarm_clock'
#
# Generated by Vivado on Tue Dec 03 13:48:23 -0500 2019
# IP Build 1681267 on Mon Oct 10 21:28:31 MDT 2016
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# NOTE: In order to use this script for source control purposes, please make sure that the
#       following files are added to the source control system:-
#
# 1. This project restoration tcl script (build.tcl) that was generated.
#
# 2. The following source(s) files that were local or imported into the original project.
#    (Please see the '$orig_proj_dir' and '$origin_dir' variable setting below at the start of the script)
#
#    <none>
#
# 3. The following remote source files that were added to the original project:-
#
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Time_Counter.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Seven_Segment_Display_Refresh.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Clock_Divider.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/BCD_To_7Segment.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Tone_Select.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Seven_Segment_Digit_Blinker.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Rotary_Encoder.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Alarm_On.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Master_Controller.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Pulse_Generator.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Time.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Debounce.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Seven_Segment_PM_MUX.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Seven_Segment_Display_Driver.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Alarm_Sound.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/Alarm_Clock.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/constrs/Nexys4DDR_Master.xdc"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Debounce_TB.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Alarm_Clock_TB.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Alarm_Time_TB.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Clock_Divider_TB.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Time_Counter_TB.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Seven_Segment_PM_MUX_TB.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Seven_Segment_Display_Driver_TB.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Time_TB.v"
#    "D:/School/ELEC_3500/Lab_9/Alarm_Clock_v2/Alarm-Clock/src/hdl/tb/Seven_Segment_Display_Refresh_TB.v"
#
#*****************************************************************************************

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

variable script_file
set script_file "build.tcl"

# Help information for this script
proc help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < [llength $::argc]} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir" { incr i; set origin_dir [lindex $::argv $i] }
      "--help"       { help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/alarm_clock"]"

# Create project
create_project alarm_clock ./alarm_clock -part xc7a100tcsg324-1

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Reconstruct message rules
# None

# Set project properties
set obj [get_projects alarm_clock]
set_property "corecontainer.enable" "1" $obj
set_property "default_lib" "xil_defaultlib" $obj
set_property "ip_cache_permissions" "read write" $obj
set_property "ip_output_repo" "D:/School/ELEC 3500/Lab 9/Alarm-Clock/alarm_clock/alarm_clock.cache/ip" $obj
set_property "part" "xc7a100tcsg324-1" $obj
set_property "sim.ip.auto_export_scripts" "1" $obj
set_property "simulator_language" "Mixed" $obj
set_property "xsim.array_display_limit" "64" $obj
set_property "xsim.trace_limit" "65536" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 "[file normalize "$origin_dir/src/hdl/Time_Counter.v"]"\
 "[file normalize "$origin_dir/src/hdl/Seven_Segment_Display_Refresh.v"]"\
 "[file normalize "$origin_dir/src/hdl/Clock_Divider.v"]"\
 "[file normalize "$origin_dir/src/hdl/BCD_To_7Segment.v"]"\
 "[file normalize "$origin_dir/src/hdl/Tone_Select.v"]"\
 "[file normalize "$origin_dir/src/hdl/Seven_Segment_Digit_Blinker.v"]"\
 "[file normalize "$origin_dir/src/hdl/Rotary_Encoder.v"]"\
 "[file normalize "$origin_dir/src/hdl/Alarm_On.v"]"\
 "[file normalize "$origin_dir/src/hdl/Master_Controller.v"]"\
 "[file normalize "$origin_dir/src/hdl/Pulse_Generator.v"]"\
 "[file normalize "$origin_dir/src/hdl/Time.v"]"\
 "[file normalize "$origin_dir/src/hdl/Debounce.v"]"\
 "[file normalize "$origin_dir/src/hdl/Seven_Segment_PM_MUX.v"]"\
 "[file normalize "$origin_dir/src/hdl/Seven_Segment_Display_Driver.v"]"\
 "[file normalize "$origin_dir/src/hdl/Alarm_Sound.v"]"\
 "[file normalize "$origin_dir/src/hdl/Alarm_Clock.v"]"\
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property "top" "Alarm_Clock" $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/src/constrs/Nexys4DDR_Master.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "$origin_dir/src/constrs/Nexys4DDR_Master.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property "file_type" "XDC" $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
set files [list \
 "[file normalize "$origin_dir/src/hdl/tb/Debounce_TB.v"]"\
 "[file normalize "$origin_dir/src/hdl/tb/Alarm_Clock_TB.v"]"\
 "[file normalize "$origin_dir/src/hdl/tb/Alarm_Time_TB.v"]"\
 "[file normalize "$origin_dir/src/hdl/tb/Clock_Divider_TB.v"]"\
 "[file normalize "$origin_dir/src/hdl/tb/Time_Counter_TB.v"]"\
 "[file normalize "$origin_dir/src/hdl/tb/Seven_Segment_PM_MUX_TB.v"]"\
 "[file normalize "$origin_dir/src/hdl/tb/Seven_Segment_Display_Driver_TB.v"]"\
 "[file normalize "$origin_dir/src/hdl/tb/Time_TB.v"]"\
 "[file normalize "$origin_dir/src/hdl/tb/Seven_Segment_Display_Refresh_TB.v"]"\
]
add_files -norecurse -fileset $obj $files

# Set 'sim_1' fileset file properties for remote files
# None

# Set 'sim_1' fileset file properties for local files
# None

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property "runtime" "10000000ns" $obj
set_property "top" "Debounce_TB" $obj
set_property "transport_int_delay" "0" $obj
set_property "transport_path_delay" "0" $obj
set_property "xelab.nosort" "1" $obj
set_property "xelab.unifast" "" $obj
set_property "xsim.simulate.runtime" "10000000ns" $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part xc7a100tcsg324-1 -flow {Vivado Synthesis 2016} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2016" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property "part" "xc7a100tcsg324-1" $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part xc7a100tcsg324-1 -flow {Vivado Implementation 2016} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2016" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property "part" "xc7a100tcsg324-1" $obj
set_property "steps.write_bitstream.args.readback_file" "0" $obj
set_property "steps.write_bitstream.args.verbose" "0" $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:alarm_clock"
