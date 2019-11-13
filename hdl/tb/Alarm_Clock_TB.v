`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Alarm_Clock_TB
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Alarm_Clock_TB;

    reg r_Clk_100MHz = 0;
    reg r_Reset = 0;
    reg r_Change_Time = 0;
    reg r_Change_Alarm = 0;
    reg r_Hours_Inc = 0;
    reg r_Minutes_Inc = 0;
    reg r_Alarm_Enable = 0;
    wire [6:0] w_Segments;
    wire [3:0] w_Anodes;
    wire w_Alarm_Enabled;
    wire w_Alarm_On;
    wire w_PM;
    
    wire w_Clk_5MHz;
    wire w_Clk_1Hz;
    wire w_Clk_1Hz_Pulse;
    wire [15:0] w_Time;
    wire [15:0] w_Alarm_Time;
    wire [15:0] w_Display_Time;
    
    Alarm_Clock DUT
    (
        .i_Clk_100MHz       (r_Clk_100MHz),
        .i_Reset            (r_Reset),
        .i_Change_Time      (r_Change_Time),
        .i_Change_Alarm     (r_Change_Alarm),
        .i_Hours_Inc        (r_Hours_Inc),
        .i_Minutes_Inc      (r_Minutes_Inc),
        .i_Alarm_Enable     (r_Alarm_Enable),
        .o_Segments         (w_Segments),
        .o_Anodes           (w_Anodes),
        .o_Alarm_Enabled    (w_Alarm_Enabled),
        .o_Alarm_On         (w_Alarm_On),
        .o_PM               (w_PM)
        
        ,
        .o_Clk_5MHz         (w_Clk_5MHz),
        .o_Clk_1Hz          (w_Clk_1Hz),
        .o_Clk_1Hz_Pulse    (w_Clk_1Hz_Pulse),
        .o_Time             (w_Time),
        .o_Alarm_Time       (w_Alarm_Time),
        .o_Display_Time     (w_Display_Time)
    );
    
//    initial begin
//        #200000 r_Change_Alarm = 1;
//        #1000 r_Minutes_Inc = 1;
//        #1000 r_Minutes_Inc = 0;
//        #100000 r_Change_Alarm = 0;
//    end
    
    always
        #5 r_Clk_100MHz = ~r_Clk_100MHz;
    
endmodule