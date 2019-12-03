`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Time_Counter
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Time_Counter
    #(
        parameter BIT_WIDTH = 1,
        parameter MAX_COUNT = 1,
        parameter START_MINUTES = 0,
        parameter START_HOURS = 0
    ) (
        input i_Clk,
        input i_Reset,
        input i_Enable,
        input i_Fraction_Seconds_Inc,
        input i_Seconds_1st_Digit_Inc,
        input i_Seconds_1st_Digit_Dec,
        input i_Seconds_2nd_Digit_Inc,
        input i_Seconds_2nd_Digit_Dec,
        input i_Minutes_1st_Digit_Inc,
        input i_Minutes_1st_Digit_Dec,
        input i_Minutes_2nd_Digit_Inc,
        input i_Minutes_2nd_Digit_Dec,
        input i_Hours_1st_Digit_Inc,
        input i_Hours_1st_Digit_Dec,
        input i_Hours_2nd_Digit_Inc,
        input i_Hours_2nd_Digit_Dec,
        output [BIT_WIDTH-1:0] o_Count
    );
    
    reg [BIT_WIDTH-1:0] r_Count = START_MINUTES*6000 + START_HOURS*360000;
    wire [22:0] w_Count_Inc;
    wire [22:0] w_Count_Dec;
    
    assign w_Count_Inc = (i_Fraction_Seconds_Inc * 1) + (i_Seconds_1st_Digit_Inc * 1000) + (i_Seconds_2nd_Digit_Inc * 100) + (i_Minutes_1st_Digit_Inc * 60000) + (i_Minutes_2nd_Digit_Inc * 6000) + (i_Hours_1st_Digit_Inc * 4320000) + (i_Hours_2nd_Digit_Inc * 360000);
    assign w_Count_Dec =  (i_Seconds_1st_Digit_Dec * 1000) + (i_Seconds_2nd_Digit_Dec * 100) + (i_Minutes_1st_Digit_Dec * 60000) + (i_Minutes_2nd_Digit_Dec * 6000) + (i_Hours_1st_Digit_Dec * 4320000) + (i_Hours_2nd_Digit_Dec * 360000);
    
    always @(posedge i_Clk or posedge i_Reset) begin
        if (i_Reset)
            r_Count <= 0;
        else if (i_Enable) begin
            if (r_Count + w_Count_Inc > MAX_COUNT + w_Count_Dec)
                r_Count <= r_Count + w_Count_Inc - w_Count_Dec - MAX_COUNT;
            else if (w_Count_Dec > r_Count + w_Count_Inc)
                r_Count <= MAX_COUNT + r_Count + w_Count_Inc - w_Count_Dec;
            else
                r_Count <= r_Count + w_Count_Inc - w_Count_Dec;
        end
    end
    
    assign o_Count = r_Count;
    
endmodule