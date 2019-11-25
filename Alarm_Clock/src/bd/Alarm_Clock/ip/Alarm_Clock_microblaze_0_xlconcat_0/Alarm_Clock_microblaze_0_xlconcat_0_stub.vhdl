-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
-- Date        : Tue Nov 19 15:33:29 2019
-- Host        : LAPTOP-CKAMQSCQ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top Alarm_Clock_microblaze_0_xlconcat_0 -prefix
--               Alarm_Clock_microblaze_0_xlconcat_0_ Alarm_Clock_microblaze_0_xlconcat_0_stub.vhdl
-- Design      : Alarm_Clock_microblaze_0_xlconcat_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alarm_Clock_microblaze_0_xlconcat_0 is
  Port ( 
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end Alarm_Clock_microblaze_0_xlconcat_0;

architecture stub of Alarm_Clock_microblaze_0_xlconcat_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "In0[0:0],In1[0:0],dout[1:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xlconcat,Vivado 2016.3";
begin
end;
