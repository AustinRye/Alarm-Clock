`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Time_Counter
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Time_Counter
    #(
        parameter BIT_WIDTH = 1,
        parameter MAX_COUNT = 1,
        parameter START_MINUTES = 0,
        parameter START_HOURS = 0
    ) (
        input i_Clk,
        input i_Reset,
        input i_Enable,
        input i_Seconds_Inc,
        input i_Minutes_Inc,
        input i_Hours_Inc,
        output [BIT_WIDTH-1:0] o_Count
    );
    
    reg [BIT_WIDTH-1:0] r_Count = START_MINUTES*60 + START_HOURS*3600;
    wire [11:0] w_Count_Add;
    
    assign w_Count_Add = (i_Seconds_Inc * 1) + (i_Minutes_Inc * 60) + (i_Hours_Inc * 3600);
    
    always @(posedge i_Clk or posedge i_Reset) begin
        if (i_Reset)
            r_Count <= 0;
        else if (i_Enable) begin
            if (r_Count + w_Count_Add > MAX_COUNT)
                r_Count <= r_Count + w_Count_Add - MAX_COUNT - 1;
            else
                r_Count <= r_Count + w_Count_Add;
        end
    end
    
    assign o_Count = r_Count;
    
endmodule