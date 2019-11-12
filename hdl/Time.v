`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Time
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Time
    #(
        parameter START_MINUTES = 0,
        parameter START_HOURS = 0
    ) (
        input i_Clk_5MHz,
        input i_Clk_1Hz_Pulse,
        input i_Reset,
        input i_Minutes_Inc,
        input i_Hours_Inc,
        output [15:0] o_Time,
        output o_PM
        
//        ,
//        output [16:0] o_Seconds,
//        output [16:0] o_Minutes,
//        output [16:0] o_Hours

//        ,
//        output [3:0] o_Minutes_1st_Digit,
//        output [3:0] o_Minutes_2nd_Digit,
//        output [3:0] o_Hours_1st_Digit,
//        output [3:0] o_Hours_2nd_Digit
    );
    
    wire [16:0] w_Seconds;
    Time_Counter
    #(
        .BIT_WIDTH      (17),
        .MAX_COUNT      (86400),
        .START_MINUTES  (START_MINUTES),
        .START_HOURS    (START_HOURS-1)
    ) U_Time_Counter (
        .i_Clk          (i_Clk_5MHz),
        .i_Reset        (i_Reset),
        .i_Enable       (1'b1),
        .i_Seconds_Inc  (i_Clk_1Hz_Pulse),
        .i_Minutes_Inc  (i_Minutes_Inc),
        .i_Hours_Inc    (i_Hours_Inc),
        .o_Count        (w_Seconds)
    );

    wire [10:0] w_Minutes = w_Seconds / 60;
    wire [3:0] w_Minutes_1st_Digit = (w_Minutes / 10) - 6 * (w_Minutes / 60);
    wire [3:0] w_Minutes_2nd_Digit = w_Minutes % 10;
    
    wire [4:0] w_Hours = w_Minutes / 60;
    wire [3:0] w_Hours_1st_Digit = w_Hours >= 4'd12 ? (w_Hours - 11) / 10 : (w_Hours + 1) / 10;
    wire [3:0] w_Hours_2nd_Digit = w_Hours >= 4'd12 ? (w_Hours - 11) % 10 : (w_Hours + 1) % 10;
    
    wire w_PM = (w_Hours >= 8'd11) & (w_Hours <= 8'd22) ? 1'b1 : 1'b0;
    
    assign o_Time = {w_Hours_1st_Digit, w_Hours_2nd_Digit, w_Minutes_1st_Digit, w_Minutes_2nd_Digit};
    assign o_PM = w_PM;
    
//    assign o_Seconds = w_Seconds;
//    assign o_Minutes = w_Minutes;
//    assign o_Hours = w_Hours;
//    assign o_Minutes_1st_Digit = w_Minutes_1st_Digit;
//    assign o_Minutes_2nd_Digit = w_Minutes_2nd_Digit;
//    assign o_Hours_1st_Digit = w_Hours_1st_Digit;
//    assign o_Hours_2nd_Digit = w_Hours_2nd_Digit;
    
endmodule