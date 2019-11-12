`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Clock_Divider_TB
//////////////////////////////////////////////////////////////////////////////////

module Clock_Divider_TB ();

    reg r_Clk_100MHz = 0;
    reg r_Reset = 0;
    
    wire w_Clk_Out;
    
    Clock_Divider
    #(
        .CLK_IN     (100000000),
        .CLK_OUT    (50000000)
    ) DUT (
        .i_Clk      (r_Clk_100MHz),
        .i_Reset    (r_Reset),
        .o_Clk      (w_Clk_Out)
    );
    
    always
        #5 r_Clk_100MHz = ~r_Clk_100MHz;
    
endmodule