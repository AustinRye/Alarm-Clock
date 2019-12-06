`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2019 12:50:16 PM
// Design Name: 
// Module Name: AlarmSound
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


module Alarm_Sound(
    input i_Clk_25MHz, //25Mhz
    input i_Clk_10Hz, //10Hz
    input i_Sound_Enable, //enables the sound to turn on
    output o_AUD_SD, //from the constraints
    output o_AUD_PWM //from the constraints
    );
    
    reg [7:0] r_Play_Sound; //register for the various sounds that the alarm will make
        
    //Determines if the sound is enabled then rotates through the 127 sounds and resets when it hits 127
    always @(posedge i_Clk_10Hz)
        begin
            if(i_Sound_Enable)
                begin
                    if (r_Play_Sound >= 127)
                        r_Play_Sound <= 0;
                    else
                        r_Play_Sound <= r_Play_Sound +1; //increments the sound
                end
            else
                r_Play_Sound <= 0;
        end
        
        reg [2:0] r_Select_Note;
        
        //These are the various sounds that will be played
        always @(posedge i_Clk_10Hz)
            case (r_Play_Sound)
                8'd0: r_Select_Note <= 3'd0;
                8'd1: r_Select_Note <= 3'd1;
                8'd2: r_Select_Note <= 3'd2;
                8'd3: r_Select_Note <= 3'd3;
                8'd4: r_Select_Note <= 3'd0;
                8'd5: r_Select_Note <= 3'd1;
                8'd6: r_Select_Note <= 3'd2;
                8'd7: r_Select_Note <= 3'd3;
                8'd8: r_Select_Note <= 3'd0;
                8'd9: r_Select_Note <= 3'd1;
                8'd10: r_Select_Note <= 3'd2;
                8'd11: r_Select_Note <= 3'd3;
                8'd12: r_Select_Note <= 3'd0;
                8'd13: r_Select_Note <= 3'd1;
                8'd14: r_Select_Note <= 3'd2;
                8'd15: r_Select_Note <= 3'd3;
                8'd16: r_Select_Note <= 3'd4;
                8'd17: r_Select_Note <= 3'd0;
                8'd18: r_Select_Note <= 3'd1;
                8'd19: r_Select_Note <= 3'd2;
                8'd20: r_Select_Note <= 3'd3;
                8'd21: r_Select_Note <= 3'd0;
                8'd22: r_Select_Note <= 3'd1;
                8'd23: r_Select_Note <= 3'd2;
                8'd24: r_Select_Note <= 3'd3;
                8'd25: r_Select_Note <= 3'd0;
                8'd26: r_Select_Note <= 3'd1;
                8'd27: r_Select_Note <= 3'd2;
                8'd28: r_Select_Note <= 3'd3;
                8'd29: r_Select_Note <= 3'd0;
                8'd30: r_Select_Note <= 3'd1;
                8'd31: r_Select_Note <= 3'd2;
                8'd32: r_Select_Note <= 3'd3;
                8'd32: r_Select_Note <= 3'd0;
                8'd33: r_Select_Note <= 3'd1;
                8'd34: r_Select_Note <= 3'd2;
                8'd35: r_Select_Note <= 3'd3;
                8'd36: r_Select_Note <= 3'd0;
                8'd37: r_Select_Note <= 3'd1;
                8'd38: r_Select_Note <= 3'd2;
                8'd39: r_Select_Note <= 3'd3;
                8'd40: r_Select_Note <= 3'd0;
                8'd41: r_Select_Note <= 3'd1;
                8'd42: r_Select_Note <= 3'd2;
                8'd43: r_Select_Note <= 3'd3;
                8'd44: r_Select_Note <= 3'd0;
                8'd45: r_Select_Note <= 3'd1;
                8'd46: r_Select_Note <= 3'd2;
                8'd47: r_Select_Note <= 3'd3;
                8'd48: r_Select_Note <= 3'd0;
                8'd49: r_Select_Note <= 3'd1;
                8'd50: r_Select_Note <= 3'd2;
                8'd51: r_Select_Note <= 3'd3;
                8'd52: r_Select_Note <= 3'd0;
                8'd53: r_Select_Note <= 3'd1;
                8'd54: r_Select_Note <= 3'd2;
                8'd55: r_Select_Note <= 3'd3;
                8'd56: r_Select_Note <= 3'd0;
                8'd57: r_Select_Note <= 3'd1;
                8'd58: r_Select_Note <= 3'd2;
                8'd59: r_Select_Note <= 3'd3;
                8'd50: r_Select_Note <= 3'd0;
                8'd61: r_Select_Note <= 3'd1;   
                8'd62: r_Select_Note <= 3'd2;
                8'd63: r_Select_Note <= 3'd3;
                8'd64: r_Select_Note <= 3'd0;
                8'd65: r_Select_Note <= 3'd1;
                8'd66: r_Select_Note <= 3'd2;
                8'd67: r_Select_Note <= 3'd3;
                8'd68: r_Select_Note <= 3'd0;
                8'd69: r_Select_Note <= 3'd1;
                8'd70: r_Select_Note <= 3'd2;
                8'd71: r_Select_Note <= 3'd3;
                8'd72: r_Select_Note <= 3'd0;
                8'd73: r_Select_Note <= 3'd1;
                8'd74: r_Select_Note <= 3'd2;
                8'd75: r_Select_Note <= 3'd3;
                8'd76: r_Select_Note <= 3'd0;
                8'd77: r_Select_Note <= 3'd1;
                8'd78: r_Select_Note <= 3'd2;
                8'd79: r_Select_Note <= 3'd3;
                8'd80: r_Select_Note <= 3'd0;
                8'd81: r_Select_Note <= 3'd1;
                8'd82: r_Select_Note <= 3'd2;
                8'd83: r_Select_Note <= 3'd3;
                8'd84: r_Select_Note <= 3'd0;
                8'd85: r_Select_Note <= 3'd1;
                8'd86: r_Select_Note <= 3'd2;
                8'd87: r_Select_Note <= 3'd3;
                8'd88: r_Select_Note <= 3'd0;
                8'd89: r_Select_Note <= 3'd1;
                8'd90: r_Select_Note <= 3'd2;
                8'd91: r_Select_Note <= 3'd3;
                8'd92: r_Select_Note <= 3'd0;
                8'd93: r_Select_Note <= 3'd1;
                8'd94: r_Select_Note <= 3'd2;
                8'd95: r_Select_Note <= 3'd3;
                8'd96: r_Select_Note <= 3'd0;
                8'd97: r_Select_Note <= 3'd1;
                8'd98: r_Select_Note <= 3'd2;
                8'd99: r_Select_Note <= 3'd3;
                8'd100: r_Select_Note <= 3'd0;
                8'd101: r_Select_Note <= 3'd1;
                8'd102: r_Select_Note <= 3'd2;
                8'd103: r_Select_Note <= 3'd3;
                8'd104: r_Select_Note <= 3'd0;
                8'd105: r_Select_Note <= 3'd1;
                8'd106: r_Select_Note <= 3'd2;
                8'd107: r_Select_Note <= 3'd3;
                8'd108: r_Select_Note <= 3'd0;
                8'd109: r_Select_Note <= 3'd1;
                8'd110: r_Select_Note <= 3'd2;
                8'd111: r_Select_Note <= 3'd3;
                8'd112: r_Select_Note <= 3'd0;
                8'd113: r_Select_Note <= 3'd1;
                8'd114: r_Select_Note <= 3'd2;
                8'd115: r_Select_Note <= 3'd3;
                8'd116: r_Select_Note <= 3'd0;
                8'd117: r_Select_Note <= 3'd1;
                8'd118: r_Select_Note <= 3'd2;
                8'd119: r_Select_Note <= 3'd3;
                8'd120: r_Select_Note <= 3'd0;
                8'd121: r_Select_Note <= 3'd1;
                8'd122: r_Select_Note <= 3'd2;
                8'd123: r_Select_Note <= 3'd3;
                8'd124: r_Select_Note <= 3'd0;
                8'd125: r_Select_Note <= 3'd1;
                8'd126: r_Select_Note <= 3'd2;
                8'd127: r_Select_Note <= 3'd3;
                
                
                default: r_Select_Note <= 3'd0;
            endcase
        //This sets the tones that are used in the PlaySound loop
        Tone_Select U_Tone_Select
        (
            .i_Clk_25MHz    (i_Clk_25MHz),
            .i_Switch       (r_Select_Note),
            .i_Enable       (i_Sound_Enable),
            .o_AUD_PWM      (w_AUD_PWM),
            .o_AUD_SD       (w_AUD_SD)
        );
        
        assign o_AUD_SD = w_AUD_SD;
        assign o_AUD_PWM = w_AUD_PWM;
    
endmodule
