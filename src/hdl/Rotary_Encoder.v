`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Rotary_Encoder
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Rotary_Encoder
    #(
        parameter DECIMAL_DIGITS = 4
    ) (
        input i_Clk,
        input i_Reset,
        input i_Encoder_Enable,
        input i_Encoder_Change_Mode,
        input i_Encoder_A_Pulse,
        input i_Encoder_B_Debounced,
        output o_Seconds_1st_Digit_Inc,
        output o_Seconds_1st_Digit_Dec,
        output o_Seconds_2nd_Digit_Inc,
        output o_Seconds_2nd_Digit_Dec,
        output o_Minutes_1st_Digit_Inc,
        output o_Minutes_1st_Digit_Dec,
        output o_Minutes_2nd_Digit_Inc,
        output o_Minutes_2nd_Digit_Dec,
        output o_Hours_1st_Digit_Inc,
        output o_Hours_1st_Digit_Dec,
        output o_Hours_2nd_Digit_Inc,
        output o_Hours_2nd_Digit_Dec,
        output o_Blink_Enable,
        output [DECIMAL_DIGITS-1:0] o_Blink_Segment_Num
    );
    
    reg r_Seconds_1st_Digit_Inc;
    reg r_Seconds_1st_Digit_Dec;
    reg r_Seconds_2nd_Digit_Inc;
    reg r_Seconds_2nd_Digit_Dec;
    reg r_Minutes_1st_Digit_Inc;
    reg r_Minutes_1st_Digit_Dec;
    reg r_Minutes_2nd_Digit_Inc;
    reg r_Minutes_2nd_Digit_Dec;
    reg r_Hours_1st_Digit_Inc;
    reg r_Hours_1st_Digit_Dec;
    reg r_Hours_2nd_Digit_Inc;
    reg r_Hours_2nd_Digit_Dec;
    reg r_Blink_Enable;
    reg r_Change_Digit, r_Change_Num;
    
    reg [DECIMAL_DIGITS-1:0] r_Digit_Sel = 2;
    
    reg [1:0] r_State, r_Next_State;
    parameter OFF = 0, CHANGE_DIGIT = 1, CHANGE_NUM = 2;
    
    always @(posedge i_Clk or posedge i_Reset) begin
        if (i_Reset)
            r_State <= OFF;
        else
            r_State <= r_Next_State;
    end
    
    always @(r_State or i_Encoder_Change_Mode) begin
        case (r_State)
            OFF:
                begin
                    if (i_Encoder_Enable)
                        r_Next_State <= CHANGE_DIGIT;
                    else
                        r_Next_State <= OFF;
                end
            CHANGE_DIGIT:
                begin
                    if (~i_Encoder_Enable)
                        r_Next_State <= OFF;
                    else if (i_Encoder_Change_Mode)
                        r_Next_State <= CHANGE_NUM;
                    else
                        r_Next_State <= CHANGE_DIGIT;
                end
            CHANGE_NUM:
                begin
                    if (~i_Encoder_Enable)
                        r_Next_State <= OFF;
                    else if (i_Encoder_Change_Mode)
                        r_Next_State <= CHANGE_DIGIT;
                    else
                        r_Next_State <= CHANGE_NUM;
                end
            default:
                begin
                    r_Next_State <= OFF;
                end
        endcase
    end
    
    always @(r_State) begin
        r_Blink_Enable <= 0;
        r_Change_Digit <= 0;
        r_Change_Num <= 0;
        case (r_State)
            CHANGE_DIGIT:
                begin
                    r_Blink_Enable <= 1;
                    r_Change_Digit <= 1;
                end
            CHANGE_NUM:
                begin
                    r_Blink_Enable <= 1;
                    r_Change_Num <= 1;
                end
        endcase
    end
    
    always @(posedge i_Clk) begin
        if (i_Encoder_Enable & r_Change_Digit) begin
            if (i_Encoder_A_Pulse) begin
                if (~i_Encoder_B_Debounced) begin
                    if (r_Digit_Sel == DECIMAL_DIGITS - 1)
                        r_Digit_Sel <= 2;
                    else
                        r_Digit_Sel <= r_Digit_Sel + 1;
                end
                else begin
                    if (r_Digit_Sel == 2)
                        r_Digit_Sel <= DECIMAL_DIGITS - 1;
                    else
                        r_Digit_Sel <= r_Digit_Sel - 1;
                end
            end
        end
    end
    
    always @(posedge i_Clk) begin
        r_Seconds_2nd_Digit_Inc = 0;
        r_Seconds_2nd_Digit_Dec = 0;
        r_Seconds_1st_Digit_Inc = 0;
        r_Seconds_1st_Digit_Dec = 0;
        r_Minutes_2nd_Digit_Inc = 0;
        r_Minutes_2nd_Digit_Dec = 0;
        r_Minutes_1st_Digit_Inc = 0;
        r_Minutes_1st_Digit_Dec = 0;
        r_Hours_2nd_Digit_Inc = 0;
        r_Hours_2nd_Digit_Dec = 0;
        r_Hours_1st_Digit_Inc = 0;
        r_Hours_1st_Digit_Dec = 0;
        if (i_Encoder_Enable & r_Change_Num) begin
            if (i_Encoder_A_Pulse) begin
                if (~i_Encoder_B_Debounced) begin
                    case (r_Digit_Sel)
                        2: r_Seconds_2nd_Digit_Dec <= 1;
                        3: r_Seconds_1st_Digit_Dec <= 1;
                        4: r_Minutes_2nd_Digit_Dec <= 1;
                        5: r_Minutes_1st_Digit_Dec <= 1;
                        6: r_Hours_2nd_Digit_Dec <= 1;
                        7: r_Hours_1st_Digit_Dec <= 1;
                    endcase
                end
                else begin
                    case (r_Digit_Sel)
                        2: r_Seconds_2nd_Digit_Inc <= 1;
                        3: r_Seconds_1st_Digit_Inc <= 1;
                        4: r_Minutes_2nd_Digit_Inc <= 1;
                        5: r_Minutes_1st_Digit_Inc <= 1;
                        6: r_Hours_2nd_Digit_Inc <= 1;
                        7: r_Hours_1st_Digit_Inc <= 1;
                    endcase
                end
            end
        end
    end
    
    assign o_Seconds_1st_Digit_Inc = r_Seconds_1st_Digit_Inc;
    assign o_Seconds_1st_Digit_Dec = r_Seconds_1st_Digit_Dec;
    assign o_Seconds_2nd_Digit_Inc = r_Seconds_2nd_Digit_Inc;
    assign o_Seconds_2nd_Digit_Dec = r_Seconds_2nd_Digit_Dec;
    assign o_Minutes_1st_Digit_Inc = r_Minutes_1st_Digit_Inc;
    assign o_Minutes_1st_Digit_Dec = r_Minutes_1st_Digit_Dec;
    assign o_Minutes_2nd_Digit_Inc = r_Minutes_2nd_Digit_Inc;
    assign o_Minutes_2nd_Digit_Dec = r_Minutes_2nd_Digit_Dec;
    assign o_Hours_1st_Digit_Inc = r_Hours_1st_Digit_Inc;
    assign o_Hours_1st_Digit_Dec = r_Hours_1st_Digit_Dec;
    assign o_Hours_2nd_Digit_Inc = r_Hours_2nd_Digit_Inc;
    assign o_Hours_2nd_Digit_Dec = r_Hours_2nd_Digit_Dec;
    assign o_Blink_Enable = r_Blink_Enable;
    assign o_Blink_Segment_Num = r_Digit_Sel;
    
endmodule