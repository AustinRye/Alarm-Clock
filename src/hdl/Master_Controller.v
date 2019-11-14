`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Master_Controller
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Master_Controller
    (
        input i_Clk,
        input i_Change_Time,
        input i_Change_Alarm,
        input i_Hours_Inc,
        input i_Minutes_Inc,
        input i_Alarm_Enable,
        input [15:0] i_Time,
        input [15:0] i_Alarm_Time,
        output o_Display_Sel,
        output o_Alarm_On,
        output o_Alarm_Enabled
    );
    
    reg r_Display_Sel = 0;
    reg r_Alarm_On;
    
    always @(posedge i_Clk) begin
        if (~i_Change_Time & i_Change_Alarm)
            r_Display_Sel <= 1;
        else
            r_Display_Sel <= 0;
            
        if (i_Alarm_Enable & (r_Alarm_On | (i_Time == i_Alarm_Time)))
            r_Alarm_On <= 1;
        else
            r_Alarm_On <= 0;
    end
    
    assign o_Display_Sel = r_Display_Sel;
    assign o_Alarm_On = r_Alarm_On;
    assign o_Alarm_Enabled = i_Alarm_Enable;
    
endmodule