`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Debounce
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Debounce
    #(
        parameter SAMPLE_NUM = 3
    ) (
        input i_Sample_Rate,
        input i_Signal,
        output o_Signal
    );
    
    reg r_Signal = 0;
    reg [SAMPLE_NUM-1:0] r_Prev_Signals = 0;
    
    always @(posedge i_Sample_Rate) begin
        if ((&r_Prev_Signals[SAMPLE_NUM-1:0]) & i_Signal)
            r_Signal <= 1;
        else
            r_Signal <= 0;
                
        r_Prev_Signals <= r_Prev_Signals << 1;
        r_Prev_Signals[0] <= i_Signal;
    end
    
    assign o_Signal = r_Signal;
    
endmodule