-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
-- Date        : Tue Oct 29 00:07:39 2019
-- Host        : LAPTOP-CKAMQSCQ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top Clock_Divider_100MHz_To_5MHz -prefix
--               Clock_Divider_100MHz_To_5MHz_ Clock_Divider_100MHz_To_5MHz_stub.vhdl
-- Design      : Clock_Divider_100MHz_To_5MHz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Divider_100MHz_To_5MHz is
  Port ( 
    o_Clk_5MHz : out STD_LOGIC;
    locked : out STD_LOGIC;
    i_Clk_100MHz : in STD_LOGIC
  );

end Clock_Divider_100MHz_To_5MHz;

architecture stub of Clock_Divider_100MHz_To_5MHz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "o_Clk_5MHz,locked,i_Clk_100MHz";
begin
end;
