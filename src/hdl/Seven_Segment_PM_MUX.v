`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven_Segment_PM_MUX
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Seven_Segment_PM_MUX
    #(
        parameter DECIMAL_DIGITS = 1
    ) (
        input i_Clk,
        input i_Display_Sel,
        input [4*DECIMAL_DIGITS-1:0] i_Time,
        input [4*DECIMAL_DIGITS-1:0] i_Alarm_Time,
        input i_Time_PM,
        input i_Alarm_PM,
        output [4*DECIMAL_DIGITS-1:0] o_Display_Time,
        output o_Display_PM
    );
    
    parameter TIME = 0, ALARM_TIME = 1;
    
    reg [4*DECIMAL_DIGITS-1:0] r_Display_Time = 0;
    reg r_Display_PM = 0;
    
    always @(i_Clk) begin
        case (i_Display_Sel)
            TIME:
                begin
                    r_Display_Time <= i_Time;
                    r_Display_PM <= i_Time_PM;
                end
            ALARM_TIME:
                begin
                    r_Display_Time <= i_Alarm_Time;
                    r_Display_PM <= i_Alarm_PM;
                end
            default:
                begin
                    r_Display_Time <= 0;
                    r_Display_PM <= 0;
                end
        endcase
    end
    
    assign o_Display_Time = r_Display_Time;
    assign o_Display_PM = r_Display_PM;
    
endmodule