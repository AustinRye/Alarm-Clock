`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Alarm_Time_TB
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Alarm_Time_TB ();
    
    reg r_Clk_5MHz = 0;
    reg r_Reset = 0;
    reg r_Minutes_Inc = 0;
    reg r_Hours_Inc = 0;
    wire [15:0] w_Alarm_Time;
    wire w_PM;
    
//    wire [16:0] w_Seconds;
//    wire [16:0] w_Minutes;
//    wire [16:0] w_Hours;
//    wire [3:0] w_Minutes_1st_Digit;
//    wire [3:0] w_Minutes_2nd_Digit;
//    wire [3:0] w_Hours_1st_Digit;
//    wire [3:0] w_Hours_2nd_Digit;
    
    Alarm_Time
    #(
        .START_MINUTES  (0),
        .START_HOURS    (23)
    ) DUT (
        .i_Clk_5MHz     (r_Clk_5MHz),
        .i_Reset        (r_Reset),
        .i_Minutes_Inc  (r_Minutes_Inc),
        .i_Hours_Inc    (r_Hours_Inc),
        .o_Alarm_Time   (w_Alarm_Time),
        .o_PM           (w_PM)
        
//        ,
//        .o_Seconds(w_Seconds),
//        .o_Minutes(w_Minutes),
//        .o_Hours(w_Hours)

//        ,
//        .o_Minutes_1st_Digit(w_Minutes_1st_Digit),
//        .o_Minutes_2nd_Digit(w_Minutes_2nd_Digit),
//        .o_Hours_1st_Digit(w_Hours_1st_Digit),
//        .o_Hours_2nd_Digit(w_Hours_2nd_Digit)
    );
    
//    initial begin
//        #30 r_Minutes_Inc = 1;
//        #2 r_Minutes_Inc = 0;
//        #30 r_Hours_Inc = 1;
//        #2 r_Hours_Inc = 0;
//    end
    
    always
        #1 r_Clk_5MHz = ~r_Clk_5MHz;
    
endmodule