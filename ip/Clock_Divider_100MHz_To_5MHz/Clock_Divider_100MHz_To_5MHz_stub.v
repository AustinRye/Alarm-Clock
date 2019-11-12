// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Tue Oct 29 00:07:39 2019
// Host        : LAPTOP-CKAMQSCQ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top Clock_Divider_100MHz_To_5MHz -prefix
//               Clock_Divider_100MHz_To_5MHz_ Clock_Divider_100MHz_To_5MHz_stub.v
// Design      : Clock_Divider_100MHz_To_5MHz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Clock_Divider_100MHz_To_5MHz(o_Clk_5MHz, locked, i_Clk_100MHz)
/* synthesis syn_black_box black_box_pad_pin="o_Clk_5MHz,locked,i_Clk_100MHz" */;
  output o_Clk_5MHz;
  output locked;
  input i_Clk_100MHz;
endmodule
