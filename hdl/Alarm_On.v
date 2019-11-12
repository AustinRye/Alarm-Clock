`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Alarm_On
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Alarm_On
    (
        input i_Clk,
        input i_Alarm_On,
        output o_Alarm_On
    );
    
    reg r_Alarm_On = 0;
    
    always @(i_Clk) begin
        if (i_Alarm_On)
            r_Alarm_On <= ~r_Alarm_On;
        else
            r_Alarm_On <= 0;
    end
    
    assign o_Alarm_On = r_Alarm_On;
    
endmodule