`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Debounce_TB
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Debounce_TB;
    
    reg r_Clk_100MHz = 0;
    reg r_Clk_5MHz_Pulse = 0;
    reg r_Signal = 0;
    wire w_Signal;
    
    Debounce
    #(
        .SAMPLE_NUM     (10)
    ) DUT (
        .i_Sample_Rate  (r_Clk_100MHz),
        .i_Signal       (r_Signal),
        .o_Signal       (w_Signal)
    );
    
    initial begin
        #1000 r_Signal = 1;
        #50 r_Signal = 0;
        #10 r_Signal = 1;
        #5000 r_Signal = 0;
        #10 r_Signal = 1;
        #5000 r_Signal = 0;
    end
    
    always
        #5 r_Clk_100MHz = ~r_Clk_100MHz;
    
endmodule