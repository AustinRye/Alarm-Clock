`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Pulse_Generator
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Pulse_Generator
    (
        input i_Clk,
        input i_Signal,
        output o_Pulse
    );
    
    reg r_Prev_Signal = 0;
    
    always @(posedge i_Clk) begin
        r_Prev_Signal <= i_Signal;
    end
    
    assign o_Pulse = i_Signal & ~r_Prev_Signal;
    
endmodule