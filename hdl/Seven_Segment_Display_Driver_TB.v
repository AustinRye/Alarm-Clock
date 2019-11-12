`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven_Segment_Display_Driver_TB
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Seven_Segment_Display_Driver_TB;

    reg r_Clk_5MHz = 0;
    reg r_Reset = 0;
    reg [15:0] r_BCD_Num = 0;
    
    wire [6:0] w_Segments;
    wire [3:0] w_Anodes;
    
    Seven_Segment_Display_Driver
    #(
        .CLK_IN         (5000000),
        .SEGMENT_NUM    (4),
        .DISPLAY_REFRESH(5000)
    ) DUT (
        .i_Clk          (r_Clk_5MHz),
        .i_Reset        (r_Reset),
        .i_BCD_Num      (r_BCD_Num),
        .o_Segments     (w_Segments),
        .o_Anodes       (w_Anodes)
    );
    
    initial begin
        r_BCD_Num = 16'b0001001001011001;
    end
        
    always
        #100 r_Clk_5MHz = ~r_Clk_5MHz;
    
endmodule