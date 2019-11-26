-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
-- Date        : Tue Nov 26 14:39:55 2019
-- Host        : LAPTOP-CKAMQSCQ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/School/ELEC_3500/Lab_9/Alarm-Clock_v3/Alarm_Clock/src/bd/Alarm_Clock/ip/Alarm_Clock_Alarm_Clock_0_1/Alarm_Clock_Alarm_Clock_0_1_stub.vhdl
-- Design      : Alarm_Clock_Alarm_Clock_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alarm_Clock_Alarm_Clock_0_1 is
  Port ( 
    i_Clk_100MHz : in STD_LOGIC;
    i_Reset : in STD_LOGIC;
    i_Change_Time : in STD_LOGIC;
    i_Change_Alarm : in STD_LOGIC;
    i_Minutes_Inc : in STD_LOGIC;
    i_Minutes_Dec : in STD_LOGIC;
    i_Hours_Inc : in STD_LOGIC;
    i_Hours_Dec : in STD_LOGIC;
    i_Alarm_Enable : in STD_LOGIC;
    o_Segments : out STD_LOGIC_VECTOR ( 6 downto 0 );
    o_Anodes : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_Alarm_Enabled : out STD_LOGIC;
    o_Alarm_On : out STD_LOGIC;
    o_PM : out STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );

end Alarm_Clock_Alarm_Clock_0_1;

architecture stub of Alarm_Clock_Alarm_Clock_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "i_Clk_100MHz,i_Reset,i_Change_Time,i_Change_Alarm,i_Minutes_Inc,i_Minutes_Dec,i_Hours_Inc,i_Hours_Dec,i_Alarm_Enable,o_Segments[6:0],o_Anodes[7:0],o_Alarm_Enabled,o_Alarm_On,o_PM,s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Alarm_Clock_v2_0,Vivado 2016.3";
begin
end;
