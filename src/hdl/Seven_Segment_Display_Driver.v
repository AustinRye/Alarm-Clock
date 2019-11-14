`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven_Segment_Display_Driver
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Seven_Segment_Display_Driver
    #(
        parameter CLK_IN = 1,
        parameter SEGMENT_NUM = 4,
        parameter SEGMENT_NUM_USED = 4,
        parameter DISPLAY_REFRESH = 500
    ) (
        input i_Clk,
        input i_Reset,
        input [4*SEGMENT_NUM-1:0] i_BCD_Num,
        output [6:0] o_Segments,
        output [SEGMENT_NUM-1:0] o_Anodes
    );
    
    wire w_Clk_Display_Refresh;
    Clock_Divider
    #(
        .CLK_IN     (CLK_IN),
        .CLK_OUT    (DISPLAY_REFRESH)
    ) U_Clock_Divider_Display_Refresh (
        .i_Clk      (i_Clk),
        .i_Reset    (i_Reset),
        .o_Clk      (w_Clk_Display_Refresh)
    );
    
    wire [3:0] w_BCD_Num_Sel;
    wire [7:0] w_Anodes;
    Seven_Segment_Display_Refresh
    #(
        .SEGMENT_NUM        (SEGMENT_NUM),
        .SEGMENT_NUM_USED   (SEGMENT_NUM_USED)
    ) U_Seven_Segment_Display_Refresh (
        .i_Refresh_Clk      (w_Clk_Display_Refresh),
        .i_BCD_Num          (i_BCD_Num),
        .o_BCD_Num_Sel      (w_BCD_Num_Sel),
        .o_Anodes           (w_Anodes)
    );
    
    wire [6:0] w_Segments;
    BCD_To_7Segment U_BCD_To_7Segment
    (
        .i_Clk      (i_Clk),
        .i_BCD_Num  (w_BCD_Num_Sel),
        .o_Segments (w_Segments)
    );
    
    assign o_Segments = w_Segments;
    assign o_Anodes = w_Anodes;
    
endmodule