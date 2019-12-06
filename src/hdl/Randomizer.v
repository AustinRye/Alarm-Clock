`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Randomizer
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Randomizer
    #(
        parameter RANGE = 1
    ) (
        input i_Clk,
        input i_Reset,
        output [RANGE-1:0] o_Random_Num
    );
    
    reg [RANGE-1:0] r_Random_Num = 0;
    
    always @(posedge i_Clk or posedge i_Reset) begin
        if (i_Reset)
            r_Random_Num <= 0;
        else
            r_Random_Num <= r_Random_Num + 1;
    end
    
    assign o_Random_Num = r_Random_Num;
    
endmodule