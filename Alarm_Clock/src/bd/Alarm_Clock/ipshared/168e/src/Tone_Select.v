`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2019 12:54:25 PM
// Design Name: 
// Module Name: ToneSelect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Tone_Select(
    input i_Clk_25MHz,
    input [2:0] i_Switch,
    input i_Enable,
    output o_AUD_PWM,
    output o_AUD_SD
    );
    
   reg r_AUD_PWM;
   reg [31:0] r_Clock_Counter;
   
   //These are the constants that produce 
   //the various tones of the sounds
   integer bConstant = 101238;
   integer eConstant = 75842;
   integer dConstant = 85131;
   integer gConstant = 127552;
    
    
    reg [31:0] r_Constant_Select;
    
    //assigns a tone to a switch value that is used 
    //in the PlaySound loop in AlarmSound
    always @(posedge i_Clk_25MHz)
        case (i_Switch)
            3'd1: r_Constant_Select <= gConstant;
            3'd2: r_Constant_Select <= bConstant;
            3'd3: r_Constant_Select <= dConstant;
            3'd4: r_Constant_Select <= eConstant;
            
            default: r_Constant_Select <= bConstant;
        endcase
    
    
    always @ (posedge i_Clk_25MHz) 
    begin
        if (i_Enable & i_Switch != 3'd0) 
        begin
            if (r_Clock_Counter > r_Constant_Select) 
            begin
                r_Clock_Counter <= 0;
                r_AUD_PWM <= !r_AUD_PWM;
            end
            else r_Clock_Counter <= r_Clock_Counter + 1;
         end
            else r_AUD_PWM <= 0;
    end
    
    assign o_AUD_SD = 1;
    assign o_AUD_PWM = r_AUD_PWM;
    
endmodule
