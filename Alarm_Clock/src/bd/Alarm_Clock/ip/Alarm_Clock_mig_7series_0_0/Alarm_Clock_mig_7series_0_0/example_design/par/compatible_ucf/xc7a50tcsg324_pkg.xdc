##################################################################################################
## 
##  Xilinx, Inc. 2010            www.xilinx.com 
##  Thu Dec 5 20:51:16 2019
##  Generated by MIG Version 4.0
##  
##################################################################################################
##  File name :       example_top.sdc
##  Details :     Constraints file
##                    FPGA Family:       ARTIX7
##                    FPGA Part:         XC7A50TCSG324_PKG
##                    Speedgrade:        -1
##                    Design Entry:      VERILOG
##                    Frequency:         0 MHz
##                    Time Period:       3333 ps
##################################################################################################

##################################################################################################
## Controller 0
## Memory Device: DDR2_SDRAM->Components->MT47H64M16HR-25E
## Data Width: 16
## Time Period: 3333
## Data Mask: 1
##################################################################################################

#create_clock -period 4.999 [get_ports sys_clk_i]
          
############## NET - IOSTANDARD ##################



set_property INTERNAL_VREF  0.900 [get_iobanks 34]