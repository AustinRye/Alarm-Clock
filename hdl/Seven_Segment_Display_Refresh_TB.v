`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven_Segment_Display_Refresh_TB
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Seven_Segment_Display_Refresh_TB ();
    
    reg r_Refresh_Clk = 0;
    reg [15:0] r_BCD_Num;
    wire [3:0] w_BCD_Num_Sel;
    wire [3:0] w_Anodes;
    
    Seven_Segment_Display_Refresh
    #(
        .SEGMENT_NUM    (4)
    ) DUT (
        .i_Refresh_Clk  (r_Refresh_Clk),
        .i_BCD_Num      (r_BCD_Num),
        .o_BCD_Num_Sel  (w_BCD_Num_Sel),
        .o_Anodes       (w_Anodes)
    );
    
    initial begin
        r_BCD_Num = 16'b0000000000000000;
        #1500 r_BCD_Num = 16'b1100101000111110;
    end
    
    always
        #5 r_Refresh_Clk = ~r_Refresh_Clk;
    
endmodule