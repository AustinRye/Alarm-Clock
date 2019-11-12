`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven_Segment_Display_Refresh
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Seven_Segment_Display_Refresh
    #(
        parameter                SEGMENT_NUM  = 1
    ) (
        input                     i_Refresh_Clk,
        input [4*SEGMENT_NUM-1:0] i_BCD_Num,
        output [3:0]              o_BCD_Num_Sel,
        output [SEGMENT_NUM-1:0]  o_Anodes
    );
    
    reg [3:0] r_BCD_Num_Sel = 0;
    reg [SEGMENT_NUM-1:0] r_Anodes = {SEGMENT_NUM{1'b1}};
    integer r_Segment_Count = 0;
    
    always @(posedge i_Refresh_Clk) begin
        if (r_Segment_Count == SEGMENT_NUM - 1)
            r_Segment_Count <= 0;
        else
            r_Segment_Count <= r_Segment_Count + 1;
            
        r_BCD_Num_Sel <= i_BCD_Num[4*r_Segment_Count+3 -: 4];
        r_Anodes <= r_Anodes << 1;
        r_Anodes[0] <= ~(r_Segment_Count == 0);
    end
    
    assign o_BCD_Num_Sel = r_BCD_Num_Sel;
    assign o_Anodes = r_Anodes;
    
endmodule