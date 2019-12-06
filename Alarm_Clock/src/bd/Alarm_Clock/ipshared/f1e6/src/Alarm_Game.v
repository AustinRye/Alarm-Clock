`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Alarm_Game
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Alarm_Game
    #(
        parameter LED_NUM = 1
    ) (
        input i_Clk,
        input i_Reset,
        input i_Alarm_Game_On,
        input [LED_NUM-1:0] i_Alarm_Game_Switches,
        output [LED_NUM-1:0] o_Alarm_Game_LEDs,
        output o_Alarm_Game_Win
    );
    
    wire [LED_NUM-1:0] w_Random_Num;
    Randomizer
    #(
        .RANGE          (LED_NUM)
    ) U_Randomizer (
        .i_Clk          (i_Clk),
        .i_Reset        (1'b0),
        .o_Random_Num   (w_Random_Num)
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Alarm Game FSM
    //////////////////////////////////////////////////////////////////////////////
    reg r_Alarm_Game_Win;
    reg [LED_NUM-1:0] r_Alarm_Game_LEDs;
    reg [LED_NUM-1:0] r_Puzzle_Code;
    
    reg [1:0] r_Alarm_Game_State, r_Alarm_Game_Next_State;
    parameter OFF = 0, START = 1, RUN = 2;
    
    always @(posedge i_Clk or posedge i_Reset) begin
        if (i_Reset)
            r_Alarm_Game_State <= OFF;
        else
            r_Alarm_Game_State <= r_Alarm_Game_Next_State;
    end
    
    always @(r_Alarm_Game_State or i_Alarm_Game_On) begin
        case (r_Alarm_Game_State)
            OFF:
                begin
                    if (i_Alarm_Game_On)
                        r_Alarm_Game_Next_State <= START;
                    else
                        r_Alarm_Game_Next_State <= OFF;
                end
            START:
                begin
                    if (~i_Alarm_Game_On)
                        r_Alarm_Game_Next_State <= OFF;
                    else
                        r_Alarm_Game_Next_State <= RUN;
                end
            RUN:
                begin
                    if (r_Alarm_Game_Win | ~i_Alarm_Game_On)
                        r_Alarm_Game_Next_State <= OFF;
                    else
                        r_Alarm_Game_Next_State <= RUN;
                end
            default:
                begin
                    r_Alarm_Game_Next_State <= OFF;
                end
        endcase
    end
    
    always @(r_Alarm_Game_State) begin
        r_Alarm_Game_Win <= 0;
        r_Alarm_Game_LEDs <= 0;
        case (r_Alarm_Game_State)
            START:
                begin
                    r_Puzzle_Code <= w_Random_Num;
                end
            RUN:
                begin
                    r_Alarm_Game_LEDs <= r_Puzzle_Code;
                    if (i_Alarm_Game_Switches == r_Puzzle_Code) begin
                        r_Alarm_Game_Win <= 1;
                    end
                end
        endcase
    end
    
    assign o_Alarm_Game_LEDs = r_Alarm_Game_LEDs;
    assign o_Alarm_Game_Win = r_Alarm_Game_Win;
    
endmodule