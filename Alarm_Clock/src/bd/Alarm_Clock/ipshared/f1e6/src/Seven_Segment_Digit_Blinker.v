`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven_Segment_Digit_Blinker
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Seven_Segment_Digit_Blinker
    #(
        parameter DECIMAL_DIGITS = 4
    ) (
        input i_Clk,
        input i_Blink_Enable,
        input i_Blink_Rate,
        input [DECIMAL_DIGITS:0] i_Blink_Segment_Num,
        input [DECIMAL_DIGITS*4-1:0] i_BCD_Num,
        output [DECIMAL_DIGITS*4-1:0] o_BCD_Num
    );
    
    reg [DECIMAL_DIGITS*4-1:0] r_BCD_Num;
    
    always @(posedge i_Clk) begin
        r_BCD_Num = i_BCD_Num;
        if (i_Blink_Enable & i_Blink_Rate)
            r_BCD_Num[4*i_Blink_Segment_Num+3 -: 4] = 4'b1110;
    end
    
    assign o_BCD_Num = r_BCD_Num;
    
endmodule