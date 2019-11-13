`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Alarm_Clock
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Alarm_Clock
    (
        input i_Clk_100MHz,
        input i_Reset,
        input i_Change_Time,
        input i_Change_Alarm,
        input i_Minutes_Inc,
        input i_Hours_Inc,
        input i_Alarm_Enable,
        output [6:0] o_Segments,
        output [7:0] o_Anodes,
        output o_Alarm_Enabled,
        output o_Alarm_On,
        output o_PM
        
//        ,
//        output o_Clk_5MHz,
//        output o_Clk_1Hz,
//        output o_Clk_1Hz_Pulse,
//        output [15:0] o_Time,
//        output [15:0] o_Alarm_Time,
//        output [15:0] o_Display_Time
    );

    //////////////////////////////////////////////////////////////////////////////
    // Clock Dividers and Pulses
    //////////////////////////////////////////////////////////////////////////////
    wire w_Clk_5MHz;
    Clock_Divider
    #(
       .CLK_IN         (100000000),
       .CLK_OUT        (5000000)
    ) U_Clock_Divider_100MHz_To_5MHz (
       .i_Clk          (i_Clk_100MHz),
       .i_Reset        (i_Reset),
       .o_Clk          (w_Clk_5MHz)
    );
    
    wire w_Clk_1KHz;
    Clock_Divider
    #(
        .CLK_IN         (5000000),
        .CLK_OUT        (1000)
    ) U_Clock_Divider_5MHz_To_1KHz (
        .i_Clk          (w_Clk_5MHz),
        .i_Reset        (i_Reset),
        .o_Clk          (w_Clk_1KHz)
    );
    
    wire w_Clk_1KHz_Pulse;
    Pulse_Generator U_1KHz_Pulse_Generator
    (
        .i_Clk          (w_Clk_5MHz),
        .i_Signal       (w_Clk_1KHz),
        .o_Pulse        (w_Clk_1KHz_Pulse)
    );
    
    wire w_Clk_1Hz;
    Clock_Divider
    #(
        .CLK_IN         (5000000),
        .CLK_OUT        (1)
    ) U_Clock_Divider_5MHz_To_1Hz (
        .i_Clk          (w_Clk_5MHz),
        .i_Reset        (i_Reset),
        .o_Clk          (w_Clk_1Hz)
    );
    
    wire w_Clk_1Hz_Pulse;
    Pulse_Generator U_1Hz_Pulse_Generator
    (
        .i_Clk          (w_Clk_5MHz),
        .i_Signal       (w_Clk_1Hz),
        .o_Pulse        (w_Clk_1Hz_Pulse)
    );
    
    wire w_Clk_0_5Hz;
    Clock_Divider
    #(
        .CLK_IN         (2500000),
        .CLK_OUT        (1)
    ) U_Clock_Divider_5MHz_To_0_5Hz (
        .i_Clk          (w_Clk_5MHz),
        .i_Reset        (i_Reset),
        .o_Clk          (w_Clk_0_5Hz)
    );
    
    wire w_Minutes_Inc;
    Debounce U_Debounce_Minutes
    (
        .i_Sample_Rate  (w_Clk_1KHz_Pulse),
        .i_Signal       (i_Minutes_Inc),
        .o_Signal       (w_Minutes_Inc)
    );
    
    wire w_Minutes_Inc_Pulse;
    Pulse_Generator U_Minutes_Inc_Pulse_Generator
    (
        .i_Clk          (w_Clk_5MHz),
        .i_Signal       (w_Minutes_Inc),
        .o_Pulse        (w_Minutes_Inc_Pulse)
    );
    
    wire w_Hours_Inc;
    Debounce U_Debounce_Hours
    (
        .i_Sample_Rate  (w_Clk_1KHz_Pulse),
        .i_Signal       (i_Hours_Inc),
        .o_Signal       (w_Hours_Inc)
    );
    
    wire w_Hours_Inc_Pulse;
    Pulse_Generator U_Hours_Inc_Pulse_Generator
    (
        .i_Clk          (w_Clk_5MHz),
        .i_Signal       (w_Hours_Inc),
        .o_Pulse        (w_Hours_Inc_Pulse)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Time and Alarm Counters
    //////////////////////////////////////////////////////////////////////////////
    wire [15:0] w_Time;
    wire w_Time_PM;
    Time
    #(
        .START_MINUTES  (0),
        .START_HOURS    (0)
    ) U_Time (
        .i_Clk_5MHz     (w_Clk_5MHz),
        .i_Clk_1Hz_Pulse(w_Clk_1Hz_Pulse),
        .i_Reset        (i_Reset),
        .i_Minutes_Inc  (i_Change_Time & w_Minutes_Inc_Pulse),
        .i_Hours_Inc    (i_Change_Time & w_Hours_Inc_Pulse),
        .o_Time         (w_Time),
        .o_PM           (w_Time_PM)
    );
    
    wire [15:0] w_Alarm_Time;
    wire w_Alarm_PM;
    Alarm_Time
    #(
        .START_MINUTES  (0),
        .START_HOURS    (0)
    ) U_Alarm_Time (
        .i_Clk_5MHz     (w_Clk_5MHz),
        .i_Reset        (i_Reset),
        .i_Minutes_Inc  (i_Change_Alarm & w_Minutes_Inc_Pulse),
        .i_Hours_Inc    (i_Change_Alarm & w_Hours_Inc_Pulse),
        .o_Alarm_Time   (w_Alarm_Time),
        .o_PM           (w_Alarm_PM)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Master Controller
    //////////////////////////////////////////////////////////////////////////////
    wire w_Display_Sel;
    wire w_Turn_Alarm_On;
    wire w_Alarm_Enabled;
    Master_Controller U_Master_Controller
    (
        .i_Clk              (w_Clk_5MHz),
        .i_Change_Time      (i_Change_Time),
        .i_Change_Alarm     (i_Change_Alarm),
        .i_Minutes_Inc      (i_Minutes_Inc),
        .i_Hours_Inc        (i_Hours_Inc),
        .i_Alarm_Enable     (i_Alarm_Enable),
        .i_Time             (w_Time),
        .i_Alarm_Time       (w_Alarm_Time),
        .o_Display_Sel      (w_Display_Sel),
        .o_Alarm_On         (w_Turn_Alarm_On),
        .o_Alarm_Enabled    (w_Alarm_Enabled)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Alarm On Controller
    //////////////////////////////////////////////////////////////////////////////
    wire w_Alarm_On;
    Alarm_On U_Alarm_On
    (
        .i_Clk          (w_Clk_0_5Hz),
        .i_Alarm_On     (w_Turn_Alarm_On),
        .o_Alarm_On     (w_Alarm_On)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Seven Segment Display Controllers
    //////////////////////////////////////////////////////////////////////////////
    wire [15:0] w_Display_Time;
    wire w_Display_PM;
    Seven_Segment_PM_MUX
    #(
        .DECIMAL_DIGITS     (4)
    ) U_Seven_Segment_PM_MUX (
        .i_Clk              (w_Clk_5MHz),
        .i_Display_Sel      (w_Display_Sel),
        .i_Time             (w_Time),
        .i_Alarm_Time       (w_Alarm_Time),
        .i_Time_PM          (w_Time_PM),
        .i_Alarm_PM         (w_Alarm_PM),
        .o_Display_Time     (w_Display_Time),
        .o_Display_PM       (w_Display_PM)
    );
    
    wire [6:0] w_Segments;
    wire [7:0] w_Anodes;
    Seven_Segment_Display_Driver
    #(
        .CLK_IN             (5000000),
        .SEGMENT_NUM        (8),
        .SEGMENT_NUM_USED   (4),
        .DISPLAY_REFRESH    (500)
    ) U_Seven_Segment_Display_Driver (
        .i_Clk              (w_Clk_5MHz),
        .i_Reset            (i_Reset),
        .i_BCD_Num          (w_Display_Time),
        .o_Segments         (w_Segments),
        .o_Anodes           (w_Anodes)
    );
    
    assign o_PM = w_Display_PM;
    assign o_Segments = w_Segments;
    assign o_Anodes = w_Anodes;
    assign o_Alarm_Enabled = w_Alarm_Enabled;
    assign o_Alarm_On = w_Alarm_On;
    
//    assign o_Clk_5MHz = w_Clk_5MHz;
//    assign o_Clk_1Hz = w_Clk_1Hz;
//    assign o_Clk_1Hz_Pulse = w_Clk_1Hz_Pulse;
//    assign o_Time = w_Time;
//    assign o_Alarm_Time = w_Alarm_Time;
//    assign o_Display_Time = w_Display_Time;
    
endmodule