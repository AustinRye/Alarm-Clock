`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Alarm_Clock
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Alarm_Clock
    (
        input i_Clk_100MHz,
        input i_Reset,
        input i_Change_Alarm,
        input i_Encoder_Enable,
        input i_Encoder_Change_Mode,
        input i_Encoder_A,
        input i_Encoder_B,
        input i_Alarm_Enable,
        input i_Alarm_Game_Enable,
        input [9:0] i_Alarm_Game_Switches,
        output [6:0] o_Segments,
        output [7:0] o_Anodes,
        output o_Alarm_Enabled,
        output o_Alarm_On,
        output [9:0] o_Alarm_Game_LEDs,
        output o_AUD_SD,
        output o_AUD_PWM,
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
    // Clock Dividers
    //////////////////////////////////////////////////////////////////////////////
    wire w_Clk_25MHz;
    Clock_Divider
    #(
       .CLK_IN         (100000000),
       .CLK_OUT        (25000000)
    ) U_Clock_Divider_100MHz_To_25MHz (
       .i_Clk          (i_Clk_100MHz),
       .i_Reset        (1'b0),
       .o_Clk          (w_Clk_25MHz)
    );
    
    wire w_Clk_5MHz;
    Clock_Divider
    #(
       .CLK_IN         (100000000),
       .CLK_OUT        (5000000)
    ) U_Clock_Divider_100MHz_To_5MHz (
       .i_Clk          (i_Clk_100MHz),
       .i_Reset        (1'b0),
       .o_Clk          (w_Clk_5MHz)
    );
    
    wire w_Clk_1KHz;
    Clock_Divider
    #(
        .CLK_IN         (5000000),
        .CLK_OUT        (1000)
    ) U_Clock_Divider_5MHz_To_1KHz (
        .i_Clk          (w_Clk_5MHz),
        .i_Reset        (1'b0),
        .o_Clk          (w_Clk_1KHz)
    );
    
    wire w_Clk_100Hz;
    Clock_Divider
    #(
        .CLK_IN         (5000000),
        .CLK_OUT        (100)
    ) U_Clock_Divider_5MHz_To_100Hz (
        .i_Clk          (w_Clk_5MHz),
        .i_Reset        (1'b0),
        .o_Clk          (w_Clk_100Hz)
    );
    
    wire w_Clk_10Hz;
    Clock_Divider
    #(
        .CLK_IN         (5000000),
        .CLK_OUT        (10)
    ) U_Clock_Divider_5MHz_To_10Hz (
        .i_Clk          (w_Clk_5MHz),
        .i_Reset        (1'b0),
        .o_Clk          (w_Clk_10Hz)
    );
    
    wire w_Clk_1Hz;
    Clock_Divider
    #(
        .CLK_IN         (5000000),
        .CLK_OUT        (1)
    ) U_Clock_Divider_5MHz_To_1Hz (
        .i_Clk          (w_Clk_5MHz),
        .i_Reset        (1'b0),
        .o_Clk          (w_Clk_1Hz)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Debouncers
    //////////////////////////////////////////////////////////////////////////////
    wire w_Encoder_Change_Mode_Debounced;
    Debounce U_Debounce_Encoder_Change_Mode
    (
        .i_Sample_Rate  (w_Clk_1KHz_Pulse),
        .i_Signal       (i_Encoder_Change_Mode),
        .o_Signal       (w_Encoder_Change_Mode_Debounced)
    );
    
    wire w_Encoder_A_Debounced;
    Debounce U_Debounce_Encoder_A
    (
        .i_Sample_Rate  (w_Clk_1KHz_Pulse),
        .i_Signal       (i_Encoder_A),
        .o_Signal       (w_Encoder_A_Debounced)
    );
    
    wire w_Encoder_B_Debounced;
    Debounce U_Debounce_Encoder_B
    (
        .i_Sample_Rate  (w_Clk_1KHz_Pulse),
        .i_Signal       (i_Encoder_B),
        .o_Signal       (w_Encoder_B_Debounced)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Pulses
    //////////////////////////////////////////////////////////////////////////////
    wire w_Clk_1KHz_Pulse;
    Pulse_Generator U_1KHz_Pulse_Generator
    (
        .i_Clk          (w_Clk_5MHz),
        .i_Signal       (w_Clk_1KHz),
        .o_Pulse        (w_Clk_1KHz_Pulse)
    );
    
    wire w_Clk_100Hz_Pulse;
    Pulse_Generator U_100Hz_Pulse_Generator
    (
        .i_Clk          (w_Clk_5MHz),
        .i_Signal       (w_Clk_100Hz),
        .o_Pulse        (w_Clk_100Hz_Pulse)
    );
    
    wire w_Encoder_Change_Mode_Pulse;
    Pulse_Generator U_Encoder_Change_Mode_Pulse_Generator
    (
        .i_Clk          (w_Clk_5MHz),
        .i_Signal       (w_Encoder_Change_Mode_Debounced),
        .o_Pulse        (w_Encoder_Change_Mode_Pulse)
    );
    
    wire w_Encoder_A_Pulse;
    Pulse_Generator U_Encoder_A_Pulse_Generator
    (
        .i_Clk          (w_Clk_5MHz),
        .i_Signal       (w_Encoder_A_Debounced),
        .o_Pulse        (w_Encoder_A_Pulse)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Rotary Encoder
    //////////////////////////////////////////////////////////////////////////////
    wire w_Blink_Enable;
    wire [3:0] w_Blink_Segment_Num;
    wire w_Seconds_1st_Digit_Inc;
    wire w_Seconds_1st_Digit_Dec;
    wire w_Seconds_2nd_Digit_Inc;
    wire w_Seconds_2nd_Digit_Dec;
    wire w_Minutes_1st_Digit_Inc;
    wire w_Minutes_1st_Digit_Dec;
    wire w_Minutes_2nd_Digit_Inc;
    wire w_Minutes_2nd_Digit_Dec;
    wire w_Hours_1st_Digit_Inc;
    wire w_Hours_1st_Digit_Dec;
    wire w_Hours_2nd_Digit_Inc;
    wire w_Hours_2nd_Digit_Dec;
    Rotary_Encoder
    #(
        .DECIMAL_DIGITS         (8)
    ) U_Rotary_Encoder (
        .i_Clk                  (w_Clk_5MHz),
        .i_Reset                (i_Reset),
        .i_Encoder_Enable       (i_Encoder_Enable),
        .i_Encoder_Change_Mode  (w_Encoder_Change_Mode_Pulse),
        .i_Encoder_A_Pulse      (w_Encoder_A_Pulse),
        .i_Encoder_B_Debounced  (w_Encoder_B_Debounced),
        .o_Seconds_1st_Digit_Inc(w_Seconds_1st_Digit_Inc),
        .o_Seconds_1st_Digit_Dec(w_Seconds_1st_Digit_Dec),
        .o_Seconds_2nd_Digit_Inc(w_Seconds_2nd_Digit_Inc),
        .o_Seconds_2nd_Digit_Dec(w_Seconds_2nd_Digit_Dec),
        .o_Minutes_1st_Digit_Inc(w_Minutes_1st_Digit_Inc),
        .o_Minutes_1st_Digit_Dec(w_Minutes_1st_Digit_Dec),
        .o_Minutes_2nd_Digit_Inc(w_Minutes_2nd_Digit_Inc),
        .o_Minutes_2nd_Digit_Dec(w_Minutes_2nd_Digit_Dec),
        .o_Hours_1st_Digit_Inc  (w_Hours_1st_Digit_Inc),
        .o_Hours_1st_Digit_Dec  (w_Hours_1st_Digit_Dec),
        .o_Hours_2nd_Digit_Inc  (w_Hours_2nd_Digit_Inc),
        .o_Hours_2nd_Digit_Dec  (w_Hours_2nd_Digit_Dec),
        .o_Blink_Enable         (w_Blink_Enable),
        .o_Blink_Segment_Num    (w_Blink_Segment_Num)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Master Controller
    //////////////////////////////////////////////////////////////////////////////
    wire [31:0] w_Time;
    wire [31:0] w_Alarm_Time;
    wire w_Enable_Count;
    wire w_Time_Seconds_1st_Digit_Inc;
    wire w_Time_Seconds_1st_Digit_Dec;
    wire w_Time_Seconds_2nd_Digit_Inc;
    wire w_Time_Seconds_2nd_Digit_Dec;
    wire w_Time_Minutes_1st_Digit_Inc;
    wire w_Time_Minutes_1st_Digit_Dec;
    wire w_Time_Minutes_2nd_Digit_Inc;
    wire w_Time_Minutes_2nd_Digit_Dec;
    wire w_Time_Hours_1st_Digit_Inc;
    wire w_Time_Hours_1st_Digit_Dec;
    wire w_Time_Hours_2nd_Digit_Inc;
    wire w_Time_Hours_2nd_Digit_Dec;
    wire w_Alarm_Seconds_1st_Digit_Inc;
    wire w_Alarm_Seconds_1st_Digit_Dec;
    wire w_Alarm_Seconds_2nd_Digit_Inc;
    wire w_Alarm_Seconds_2nd_Digit_Dec;
    wire w_Alarm_Minutes_1st_Digit_Inc;
    wire w_Alarm_Minutes_1st_Digit_Dec;
    wire w_Alarm_Minutes_2nd_Digit_Inc;
    wire w_Alarm_Minutes_2nd_Digit_Dec;
    wire w_Alarm_Hours_1st_Digit_Inc;
    wire w_Alarm_Hours_1st_Digit_Dec;
    wire w_Alarm_Hours_2nd_Digit_Inc;
    wire w_Alarm_Hours_2nd_Digit_Dec;
    wire w_Display_Sel;
    wire w_Turn_Alarm_On;
    wire w_Alarm_Enabled;
    wire w_Alarm_Game_Win;
    wire w_Alarm_Game_On;
    Master_Controller U_Master_Controller
    (
        .i_Clk                          (w_Clk_5MHz),
        .i_Reset                        (i_Reset),
        .i_Change_Alarm                 (i_Change_Alarm),
        .i_Encoder_Enable               (i_Encoder_Enable),
        .i_Seconds_1st_Digit_Inc        (w_Seconds_1st_Digit_Inc),
        .i_Seconds_1st_Digit_Dec        (w_Seconds_1st_Digit_Dec),
        .i_Seconds_2nd_Digit_Inc        (w_Seconds_2nd_Digit_Inc),
        .i_Seconds_2nd_Digit_Dec        (w_Seconds_2nd_Digit_Dec),
        .i_Minutes_1st_Digit_Inc        (w_Minutes_1st_Digit_Inc),
        .i_Minutes_1st_Digit_Dec        (w_Minutes_1st_Digit_Dec),
        .i_Minutes_2nd_Digit_Inc        (w_Minutes_2nd_Digit_Inc),
        .i_Minutes_2nd_Digit_Dec        (w_Minutes_2nd_Digit_Dec),
        .i_Hours_1st_Digit_Inc          (w_Hours_1st_Digit_Inc),
        .i_Hours_1st_Digit_Dec          (w_Hours_1st_Digit_Dec),
        .i_Hours_2nd_Digit_Inc          (w_Hours_2nd_Digit_Inc),
        .i_Hours_2nd_Digit_Dec          (w_Hours_2nd_Digit_Dec),
        .i_Alarm_Enable                 (i_Alarm_Enable),
        .i_Time                         (w_Time),
        .i_Alarm_Time                   (w_Alarm_Time),
        .i_Alarm_Game_Enable            (i_Alarm_Game_Enable),
        .i_Alarm_Game_Win               (w_Alarm_Game_Win),
        .o_Enable_Count                 (w_Enable_Count),
        .o_Time_Seconds_1st_Digit_Inc   (w_Time_Seconds_1st_Digit_Inc),
        .o_Time_Seconds_1st_Digit_Dec   (w_Time_Seconds_1st_Digit_Dec),
        .o_Time_Seconds_2nd_Digit_Inc   (w_Time_Seconds_2nd_Digit_Inc),
        .o_Time_Seconds_2nd_Digit_Dec   (w_Time_Seconds_2nd_Digit_Dec),
        .o_Time_Minutes_1st_Digit_Inc   (w_Time_Minutes_1st_Digit_Inc),
        .o_Time_Minutes_1st_Digit_Dec   (w_Time_Minutes_1st_Digit_Dec),
        .o_Time_Minutes_2nd_Digit_Inc   (w_Time_Minutes_2nd_Digit_Inc),
        .o_Time_Minutes_2nd_Digit_Dec   (w_Time_Minutes_2nd_Digit_Dec),
        .o_Time_Hours_1st_Digit_Inc     (w_Time_Hours_1st_Digit_Inc),
        .o_Time_Hours_1st_Digit_Dec     (w_Time_Hours_1st_Digit_Dec),
        .o_Time_Hours_2nd_Digit_Inc     (w_Time_Hours_2nd_Digit_Inc),
        .o_Time_Hours_2nd_Digit_Dec     (w_Time_Hours_2nd_Digit_Dec),
        .o_Alarm_Seconds_1st_Digit_Inc  (w_Alarm_Seconds_1st_Digit_Inc),
        .o_Alarm_Seconds_1st_Digit_Dec  (w_Alarm_Seconds_1st_Digit_Dec),
        .o_Alarm_Seconds_2nd_Digit_Inc  (w_Alarm_Seconds_2nd_Digit_Inc),
        .o_Alarm_Seconds_2nd_Digit_Dec  (w_Alarm_Seconds_2nd_Digit_Dec),
        .o_Alarm_Minutes_1st_Digit_Inc  (w_Alarm_Minutes_1st_Digit_Inc),
        .o_Alarm_Minutes_1st_Digit_Dec  (w_Alarm_Minutes_1st_Digit_Dec),
        .o_Alarm_Minutes_2nd_Digit_Inc  (w_Alarm_Minutes_2nd_Digit_Inc),
        .o_Alarm_Minutes_2nd_Digit_Dec  (w_Alarm_Minutes_2nd_Digit_Dec),
        .o_Alarm_Hours_1st_Digit_Inc    (w_Alarm_Hours_1st_Digit_Inc),
        .o_Alarm_Hours_1st_Digit_Dec    (w_Alarm_Hours_1st_Digit_Dec),
        .o_Alarm_Hours_2nd_Digit_Inc    (w_Alarm_Hours_2nd_Digit_Inc),
        .o_Alarm_Hours_2nd_Digit_Dec    (w_Alarm_Hours_2nd_Digit_Dec),
        .o_Display_Sel                  (w_Display_Sel),
        .o_Alarm_On                     (w_Turn_Alarm_On),
        .o_Alarm_Enabled                (w_Alarm_Enabled),
        .o_Alarm_Game_On                (w_Alarm_Game_On)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Time and Alarm Counters
    //////////////////////////////////////////////////////////////////////////////
    wire w_Time_PM;
    Time
    #(
        .START_MINUTES          (0),
        .START_HOURS            (0)
    ) U_Time (
        .i_Clk_5MHz             (w_Clk_5MHz),
        .i_Clk_100Hz_Pulse      (w_Clk_100Hz_Pulse),
        .i_Reset                (i_Reset),
        .i_Enable_Count         (w_Enable_Count),
        .i_Seconds_1st_Digit_Inc(w_Time_Seconds_1st_Digit_Inc),
        .i_Seconds_1st_Digit_Dec(w_Time_Seconds_1st_Digit_Dec),
        .i_Seconds_2nd_Digit_Inc(w_Time_Seconds_2nd_Digit_Inc),
        .i_Seconds_2nd_Digit_Dec(w_Time_Seconds_2nd_Digit_Dec),
        .i_Minutes_1st_Digit_Inc(w_Time_Minutes_1st_Digit_Inc),
        .i_Minutes_1st_Digit_Dec(w_Time_Minutes_1st_Digit_Dec),
        .i_Minutes_2nd_Digit_Inc(w_Time_Minutes_2nd_Digit_Inc),
        .i_Minutes_2nd_Digit_Dec(w_Time_Minutes_2nd_Digit_Dec),
        .i_Hours_1st_Digit_Inc  (w_Time_Hours_1st_Digit_Inc),
        .i_Hours_1st_Digit_Dec  (w_Time_Hours_1st_Digit_Dec),
        .i_Hours_2nd_Digit_Inc  (w_Time_Hours_2nd_Digit_Inc),
        .i_Hours_2nd_Digit_Dec  (w_Time_Hours_2nd_Digit_Dec),
        .o_Time                 (w_Time),
        .o_PM                   (w_Time_PM)
    );
    
    wire w_Alarm_PM;
    Time
    #(
        .START_MINUTES          (0),
        .START_HOURS            (0)
    ) U_Alarm_Time (
        .i_Clk_5MHz             (w_Clk_5MHz),
        .i_Clk_100Hz_Pulse      (1'b0),
        .i_Reset                (i_Reset),
        .i_Enable_Count         (1'b0),
        .i_Seconds_1st_Digit_Inc(w_Alarm_Seconds_1st_Digit_Inc),
        .i_Seconds_1st_Digit_Dec(w_Alarm_Seconds_1st_Digit_Dec),
        .i_Seconds_2nd_Digit_Inc(w_Alarm_Seconds_2nd_Digit_Inc),
        .i_Seconds_2nd_Digit_Dec(w_Alarm_Seconds_2nd_Digit_Dec),
        .i_Minutes_1st_Digit_Inc(w_Alarm_Minutes_1st_Digit_Inc),
        .i_Minutes_1st_Digit_Dec(w_Alarm_Minutes_1st_Digit_Dec),
        .i_Minutes_2nd_Digit_Inc(w_Alarm_Minutes_2nd_Digit_Inc),
        .i_Minutes_2nd_Digit_Dec(w_Alarm_Minutes_2nd_Digit_Dec),
        .i_Hours_1st_Digit_Inc  (w_Alarm_Hours_1st_Digit_Inc),
        .i_Hours_1st_Digit_Dec  (w_Alarm_Hours_1st_Digit_Dec),
        .i_Hours_2nd_Digit_Inc  (w_Alarm_Hours_2nd_Digit_Inc),
        .i_Hours_2nd_Digit_Dec  (w_Alarm_Hours_2nd_Digit_Dec),
        .o_Time                 (w_Alarm_Time),
        .o_PM                   (w_Alarm_PM)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Alarm On Controller
    //////////////////////////////////////////////////////////////////////////////
    wire w_Alarm_On;
    Alarm_On U_Alarm_On
    (
        .i_Clk          (w_Clk_1Hz),
        .i_Alarm_On     (w_Turn_Alarm_On),
        .o_Alarm_On     (w_Alarm_On)
    );
    
    wire w_AUD_SD;
    wire w_AUD_PWM;
    Alarm_Sound U_Alarm_Sound
    (
        .i_Clk_25MHz    (w_Clk_25MHz),
        .i_Clk_10Hz     (w_Clk_10Hz),
        .i_Sound_Enable (w_Turn_Alarm_On),
        .o_AUD_SD       (w_AUD_SD),
        .o_AUD_PWM      (w_AUD_PWM)
    );
    
    wire [9:0] w_Alarm_Game_LEDs;
    Alarm_Game
    #(
        .LED_NUM                (10)
    ) U_Alarm_Game (
        .i_Clk                  (w_Clk_5MHz),
        .i_Reset                (i_Reset),
        .i_Alarm_Game_On        (w_Alarm_Game_On),
        .i_Alarm_Game_Switches  (i_Alarm_Game_Switches),
        .o_Alarm_Game_LEDs      (w_Alarm_Game_LEDs),
        .o_Alarm_Game_Win       (w_Alarm_Game_Win)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Seven Segment Display Controllers
    //////////////////////////////////////////////////////////////////////////////
    wire [31:0] w_Display_Time;
    wire w_Display_PM;
    Seven_Segment_PM_MUX
    #(
        .DECIMAL_DIGITS     (8)
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
    
    wire [31:0] w_Display_Time_Blink;
    Seven_Segment_Digit_Blinker
    #(
        .DECIMAL_DIGITS         (8)
    ) U_Seven_Segment_Digit_Blinker (
        .i_Clk                  (w_Clk_5MHz),
        .i_Blink_Enable         (w_Blink_Enable),
        .i_Blink_Rate           (w_Clk_1Hz),
        .i_Blink_Segment_Num    (w_Blink_Segment_Num),
        .i_BCD_Num              (w_Display_Time),
        .o_BCD_Num              (w_Display_Time_Blink)
    );
    
    wire [6:0] w_Segments;
    wire [7:0] w_Anodes;
    Seven_Segment_Display_Driver
    #(
        .CLK_IN             (5000000),
        .SEGMENT_NUM        (8),
        .SEGMENT_NUM_USED   (8),
        .DISPLAY_REFRESH    (500)
    ) U_Seven_Segment_Display_Driver (
        .i_Clk              (w_Clk_5MHz),
        .i_Reset            (i_Reset),
        .i_BCD_Num          (w_Display_Time_Blink),
        .o_Segments         (w_Segments),
        .o_Anodes           (w_Anodes)
    );
    
    assign o_PM = w_Display_PM;
    assign o_Segments = w_Segments;
    assign o_Anodes = w_Anodes;
    assign o_Alarm_Enabled = w_Alarm_Enabled;
    assign o_Alarm_On = w_Alarm_On;
    assign o_Alarm_Game_LEDs = w_Alarm_Game_LEDs;
    assign o_AUD_SD = w_AUD_SD;
    assign o_AUD_PWM = w_AUD_PWM;
    
//    assign o_Clk_5MHz = w_Clk_5MHz;
//    assign o_Clk_1Hz = w_Clk_1Hz;
//    assign o_Clk_1Hz_Pulse = w_Clk_1Hz_Pulse;
//    assign o_Time = w_Time;
//    assign o_Alarm_Time = w_Alarm_Time;
//    assign o_Display_Time = w_Display_Time;
    
endmodule