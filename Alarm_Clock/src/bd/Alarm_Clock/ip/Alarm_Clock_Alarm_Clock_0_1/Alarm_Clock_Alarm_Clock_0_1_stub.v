// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Tue Nov 26 14:39:55 2019
// Host        : LAPTOP-CKAMQSCQ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/School/ELEC_3500/Lab_9/Alarm-Clock_v3/Alarm_Clock/src/bd/Alarm_Clock/ip/Alarm_Clock_Alarm_Clock_0_1/Alarm_Clock_Alarm_Clock_0_1_stub.v
// Design      : Alarm_Clock_Alarm_Clock_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Alarm_Clock_v2_0,Vivado 2016.3" *)
module Alarm_Clock_Alarm_Clock_0_1(i_Clk_100MHz, i_Reset, i_Change_Time, 
  i_Change_Alarm, i_Minutes_Inc, i_Minutes_Dec, i_Hours_Inc, i_Hours_Dec, i_Alarm_Enable, 
  o_Segments, o_Anodes, o_Alarm_Enabled, o_Alarm_On, o_PM, s00_axi_awaddr, s00_axi_awprot, 
  s00_axi_awvalid, s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, s00_axi_wvalid, 
  s00_axi_wready, s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, s00_axi_araddr, 
  s00_axi_arprot, s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, s00_axi_rresp, 
  s00_axi_rvalid, s00_axi_rready, s00_axi_aclk, s00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="i_Clk_100MHz,i_Reset,i_Change_Time,i_Change_Alarm,i_Minutes_Inc,i_Minutes_Dec,i_Hours_Inc,i_Hours_Dec,i_Alarm_Enable,o_Segments[6:0],o_Anodes[7:0],o_Alarm_Enabled,o_Alarm_On,o_PM,s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn" */;
  input i_Clk_100MHz;
  input i_Reset;
  input i_Change_Time;
  input i_Change_Alarm;
  input i_Minutes_Inc;
  input i_Minutes_Dec;
  input i_Hours_Inc;
  input i_Hours_Dec;
  input i_Alarm_Enable;
  output [6:0]o_Segments;
  output [7:0]o_Anodes;
  output o_Alarm_Enabled;
  output o_Alarm_On;
  output o_PM;
  input [3:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [3:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
  input s00_axi_aclk;
  input s00_axi_aresetn;
endmodule
