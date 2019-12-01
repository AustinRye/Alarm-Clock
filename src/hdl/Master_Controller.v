`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Master_Controller
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Master_Controller
    (
        input i_Clk,
        input i_Reset,
        input i_Change_Alarm,
        input i_Encoder_Enable,
        input i_Seconds_1st_Digit_Inc,
        input i_Seconds_1st_Digit_Dec,
        input i_Seconds_2nd_Digit_Inc,
        input i_Seconds_2nd_Digit_Dec,
        input i_Minutes_1st_Digit_Inc,
        input i_Minutes_1st_Digit_Dec,
        input i_Minutes_2nd_Digit_Inc,
        input i_Minutes_2nd_Digit_Dec,
        input i_Hours_1st_Digit_Inc,
        input i_Hours_1st_Digit_Dec,
        input i_Hours_2nd_Digit_Inc,
        input i_Hours_2nd_Digit_Dec,
        input i_Alarm_Enable,
        input [31:0] i_Time,
        input [31:0] i_Alarm_Time,
        output o_Enable_Count,
        output o_Time_Seconds_1st_Digit_Inc,
        output o_Time_Seconds_1st_Digit_Dec,
        output o_Time_Seconds_2nd_Digit_Inc,
        output o_Time_Seconds_2nd_Digit_Dec,
        output o_Time_Minutes_1st_Digit_Inc,
        output o_Time_Minutes_1st_Digit_Dec,
        output o_Time_Minutes_2nd_Digit_Inc,
        output o_Time_Minutes_2nd_Digit_Dec,
        output o_Time_Hours_1st_Digit_Inc,
        output o_Time_Hours_1st_Digit_Dec,
        output o_Time_Hours_2nd_Digit_Inc,
        output o_Time_Hours_2nd_Digit_Dec,
        output o_Alarm_Seconds_1st_Digit_Inc,
        output o_Alarm_Seconds_1st_Digit_Dec,
        output o_Alarm_Seconds_2nd_Digit_Inc,
        output o_Alarm_Seconds_2nd_Digit_Dec,
        output o_Alarm_Minutes_1st_Digit_Inc,
        output o_Alarm_Minutes_1st_Digit_Dec,
        output o_Alarm_Minutes_2nd_Digit_Inc,
        output o_Alarm_Minutes_2nd_Digit_Dec,
        output o_Alarm_Hours_1st_Digit_Inc,
        output o_Alarm_Hours_1st_Digit_Dec,
        output o_Alarm_Hours_2nd_Digit_Inc,
        output o_Alarm_Hours_2nd_Digit_Dec,
        output o_Display_Sel,
        output o_Alarm_On,
        output o_Alarm_Enabled
    );
    
    //////////////////////////////////////////////////////////////////////////////
    // Time FSM
    //////////////////////////////////////////////////////////////////////////////
    
    reg r_Enable_Count;
    reg r_Time_Seconds_1st_Digit_Inc;
    reg r_Time_Seconds_1st_Digit_Dec;
    reg r_Time_Seconds_2nd_Digit_Inc;
    reg r_Time_Seconds_2nd_Digit_Dec;
    reg r_Time_Minutes_1st_Digit_Inc;
    reg r_Time_Minutes_1st_Digit_Dec;
    reg r_Time_Minutes_2nd_Digit_Inc;
    reg r_Time_Minutes_2nd_Digit_Dec;
    reg r_Time_Hours_1st_Digit_Inc;
    reg r_Time_Hours_1st_Digit_Dec;
    reg r_Time_Hours_2nd_Digit_Inc;
    reg r_Time_Hours_2nd_Digit_Dec;
    reg r_Alarm_Seconds_1st_Digit_Inc;
    reg r_Alarm_Seconds_1st_Digit_Dec;
    reg r_Alarm_Seconds_2nd_Digit_Inc;
    reg r_Alarm_Seconds_2nd_Digit_Dec;
    reg r_Alarm_Minutes_1st_Digit_Inc;
    reg r_Alarm_Minutes_1st_Digit_Dec;
    reg r_Alarm_Minutes_2nd_Digit_Inc;
    reg r_Alarm_Minutes_2nd_Digit_Dec;
    reg r_Alarm_Hours_1st_Digit_Inc;
    reg r_Alarm_Hours_1st_Digit_Dec;
    reg r_Alarm_Hours_2nd_Digit_Inc;
    reg r_Alarm_Hours_2nd_Digit_Dec;
    reg r_Display_Sel;
    
    reg [1:0] r_Time_State, r_Time_Next_State;
    parameter RESET = 0, RUN = 1, SET = 2;
    
    always @(posedge i_Clk or posedge i_Reset) begin
        if (i_Reset)
            r_Time_State <= RESET;
        else
            r_Time_State <= r_Time_Next_State;
    end
    
    always @(r_Time_State or i_Encoder_Enable) begin
        case (r_Time_State)
            RESET:
                begin
                    if (i_Reset)
                        r_Time_Next_State <= RESET;
                    else if (i_Encoder_Enable)
                        r_Time_Next_State <= SET;
                    else
                        r_Time_Next_State <= RUN;
                end
            RUN:
                begin
                    if (i_Encoder_Enable)
                        r_Time_Next_State <= SET;
                    else
                        r_Time_Next_State <= RUN;
                end
            SET:
                begin
                    if (i_Encoder_Enable)
                        r_Time_Next_State <= SET;
                    else
                        r_Time_Next_State <= RUN;
                end
            default:
                begin
                    r_Time_Next_State <= RUN;
                end
        endcase
    end
    
    always @(r_Time_State) begin
        r_Enable_Count <= 1;
        r_Time_Seconds_1st_Digit_Inc <= 0;
        r_Time_Seconds_1st_Digit_Dec <= 0;
        r_Time_Seconds_2nd_Digit_Inc <= 0;
        r_Time_Seconds_2nd_Digit_Dec <= 0;
        r_Time_Minutes_1st_Digit_Inc <= 0;
        r_Time_Minutes_1st_Digit_Dec <= 0;
        r_Time_Minutes_2nd_Digit_Inc <= 0;
        r_Time_Minutes_2nd_Digit_Dec <= 0;
        r_Time_Hours_1st_Digit_Inc <= 0;
        r_Time_Hours_1st_Digit_Dec <= 0;
        r_Time_Hours_2nd_Digit_Inc <= 0;
        r_Time_Hours_2nd_Digit_Dec <= 0;
        r_Alarm_Seconds_1st_Digit_Inc <= 0;
        r_Alarm_Seconds_1st_Digit_Dec <= 0;
        r_Alarm_Seconds_2nd_Digit_Inc <= 0;
        r_Alarm_Seconds_2nd_Digit_Dec <= 0;
        r_Alarm_Minutes_1st_Digit_Inc <= 0;
        r_Alarm_Minutes_1st_Digit_Dec <= 0;
        r_Alarm_Minutes_2nd_Digit_Inc <= 0;
        r_Alarm_Minutes_2nd_Digit_Dec <= 0;
        r_Alarm_Hours_1st_Digit_Inc <= 0;
        r_Alarm_Hours_1st_Digit_Dec <= 0;
        r_Alarm_Hours_2nd_Digit_Inc <= 0;
        r_Alarm_Hours_2nd_Digit_Dec <= 0;
        r_Display_Sel <= (i_Change_Alarm) ? 1 : 0;
        
        case (r_Time_State)
            SET:
                begin
                    r_Enable_Count <= (~i_Change_Alarm) ? 0 : 1;
                    r_Time_Seconds_1st_Digit_Inc <= (~i_Change_Alarm & i_Seconds_1st_Digit_Inc) ? 1 : 0;
                    r_Time_Seconds_1st_Digit_Dec <= (~i_Change_Alarm & i_Seconds_1st_Digit_Dec) ? 1 : 0;
                    r_Time_Seconds_2nd_Digit_Inc <= (~i_Change_Alarm & i_Seconds_2nd_Digit_Inc) ? 1 : 0;
                    r_Time_Seconds_2nd_Digit_Dec <= (~i_Change_Alarm & i_Seconds_2nd_Digit_Dec) ? 1 : 0;
                    r_Time_Minutes_1st_Digit_Inc <= (~i_Change_Alarm & i_Minutes_1st_Digit_Inc) ? 1 : 0;
                    r_Time_Minutes_1st_Digit_Dec <= (~i_Change_Alarm & i_Minutes_1st_Digit_Dec) ? 1 : 0;
                    r_Time_Minutes_2nd_Digit_Inc <= (~i_Change_Alarm & i_Minutes_2nd_Digit_Inc) ? 1 : 0;
                    r_Time_Minutes_2nd_Digit_Dec <= (~i_Change_Alarm & i_Minutes_2nd_Digit_Dec) ? 1 : 0;
                    r_Time_Hours_1st_Digit_Inc <= (~i_Change_Alarm & i_Hours_1st_Digit_Inc) ? 1 : 0;
                    r_Time_Hours_1st_Digit_Dec <= (~i_Change_Alarm & i_Hours_1st_Digit_Dec) ? 1 : 0;
                    r_Time_Hours_2nd_Digit_Inc <= (~i_Change_Alarm & i_Hours_2nd_Digit_Inc) ? 1 : 0;
                    r_Time_Hours_2nd_Digit_Dec <= (~i_Change_Alarm & i_Hours_2nd_Digit_Dec) ? 1 : 0;
                    r_Alarm_Seconds_1st_Digit_Inc <= (i_Change_Alarm & i_Seconds_1st_Digit_Inc) ? 1 : 0;
                    r_Alarm_Seconds_1st_Digit_Dec <= (i_Change_Alarm & i_Seconds_1st_Digit_Dec) ? 1 : 0;
                    r_Alarm_Seconds_2nd_Digit_Inc <= (i_Change_Alarm & i_Seconds_2nd_Digit_Inc) ? 1 : 0;
                    r_Alarm_Seconds_2nd_Digit_Dec <= (i_Change_Alarm & i_Seconds_2nd_Digit_Dec) ? 1 : 0;
                    r_Alarm_Minutes_1st_Digit_Inc <= (i_Change_Alarm & i_Minutes_1st_Digit_Inc) ? 1 : 0;
                    r_Alarm_Minutes_1st_Digit_Dec <= (i_Change_Alarm & i_Minutes_1st_Digit_Dec) ? 1 : 0;
                    r_Alarm_Minutes_2nd_Digit_Inc <= (i_Change_Alarm & i_Minutes_2nd_Digit_Inc) ? 1 : 0;
                    r_Alarm_Minutes_2nd_Digit_Dec <= (i_Change_Alarm & i_Minutes_2nd_Digit_Dec) ? 1 : 0;
                    r_Alarm_Hours_1st_Digit_Inc <= (i_Change_Alarm & i_Hours_1st_Digit_Inc) ? 1 : 0;
                    r_Alarm_Hours_1st_Digit_Dec <= (i_Change_Alarm & i_Hours_1st_Digit_Dec) ? 1 : 0;
                    r_Alarm_Hours_2nd_Digit_Inc <= (i_Change_Alarm & i_Hours_2nd_Digit_Inc) ? 1 : 0;
                    r_Alarm_Hours_2nd_Digit_Dec <= (i_Change_Alarm & i_Hours_2nd_Digit_Dec) ? 1 : 0;
                end
        endcase
    end
    
//    //////////////////////////////////////////////////////////////////////////////
//    // Alarm FSM
//    //////////////////////////////////////////////////////////////////////////////
    
    reg r_Alarm_On;
    
    reg r_Alarm_State, r_Alarm_Next_State;
    parameter OFF = 0, ON = 1;
    
    always @(posedge i_Clk or posedge i_Reset) begin
        if (i_Reset)
            r_Alarm_State <= OFF;
        else
            r_Alarm_State <= r_Alarm_Next_State;
    end
    
    always @(r_Alarm_State or i_Alarm_Enable) begin
        case (r_Alarm_State)
            OFF:
                begin
                    if (~i_Reset & i_Alarm_Enable & (i_Time == i_Alarm_Time))
                        r_Alarm_Next_State <= ON;
                    else
                        r_Alarm_Next_State <= OFF;
                end
            ON:
                begin
                    if (i_Reset | ~i_Alarm_Enable)
                        r_Alarm_Next_State <= OFF;
                    else
                        r_Alarm_Next_State <= ON;
                end
            default:
                begin
                    r_Alarm_Next_State <= OFF;
                end
        endcase
    end
    
    always @(r_Alarm_State) begin
        case (r_Alarm_State)
            OFF:
                begin
                    r_Alarm_On <= 0;
                end
            ON:
                begin
                    r_Alarm_On <= 1;
                end
            default:
                begin
                    r_Alarm_On <= 0;
                end
        endcase
    end
    
    assign o_Enable_Count = r_Enable_Count;
    assign o_Time_Seconds_1st_Digit_Inc = r_Time_Seconds_1st_Digit_Inc;
    assign o_Time_Seconds_1st_Digit_Dec = r_Time_Seconds_1st_Digit_Dec;
    assign o_Time_Seconds_2nd_Digit_Inc = r_Time_Seconds_2nd_Digit_Inc;
    assign o_Time_Seconds_2nd_Digit_Dec = r_Time_Seconds_2nd_Digit_Dec;
    assign o_Time_Minutes_1st_Digit_Inc = r_Time_Minutes_1st_Digit_Inc;
    assign o_Time_Minutes_1st_Digit_Dec = r_Time_Minutes_1st_Digit_Dec;
    assign o_Time_Minutes_2nd_Digit_Inc = r_Time_Minutes_2nd_Digit_Inc;
    assign o_Time_Minutes_2nd_Digit_Dec = r_Time_Minutes_2nd_Digit_Dec;
    assign o_Time_Hours_1st_Digit_Inc = r_Time_Hours_1st_Digit_Inc;
    assign o_Time_Hours_1st_Digit_Dec = r_Time_Hours_1st_Digit_Dec;
    assign o_Time_Hours_2nd_Digit_Inc = r_Time_Hours_2nd_Digit_Inc;
    assign o_Time_Hours_2nd_Digit_Dec = r_Time_Hours_2nd_Digit_Dec;
    assign o_Alarm_Seconds_1st_Digit_Inc = r_Alarm_Seconds_1st_Digit_Inc;
    assign o_Alarm_Seconds_1st_Digit_Dec = r_Alarm_Seconds_1st_Digit_Dec;
    assign o_Alarm_Seconds_2nd_Digit_Inc = r_Alarm_Seconds_2nd_Digit_Inc;
    assign o_Alarm_Seconds_2nd_Digit_Dec = r_Alarm_Seconds_2nd_Digit_Dec;
    assign o_Alarm_Minutes_1st_Digit_Inc = r_Alarm_Minutes_1st_Digit_Inc;
    assign o_Alarm_Minutes_1st_Digit_Dec = r_Alarm_Minutes_1st_Digit_Dec;
    assign o_Alarm_Minutes_2nd_Digit_Inc = r_Alarm_Minutes_2nd_Digit_Inc;
    assign o_Alarm_Minutes_2nd_Digit_Dec = r_Alarm_Minutes_2nd_Digit_Dec;
    assign o_Alarm_Hours_1st_Digit_Inc = r_Alarm_Hours_1st_Digit_Inc;
    assign o_Alarm_Hours_1st_Digit_Dec = r_Alarm_Hours_1st_Digit_Dec;
    assign o_Alarm_Hours_2nd_Digit_Inc = r_Alarm_Hours_2nd_Digit_Inc;
    assign o_Alarm_Hours_2nd_Digit_Dec = r_Alarm_Hours_2nd_Digit_Dec;
    assign o_Display_Sel = r_Display_Sel;
    assign o_Alarm_On = r_Alarm_On;
    assign o_Alarm_Enabled = i_Alarm_Enable;
    
endmodule