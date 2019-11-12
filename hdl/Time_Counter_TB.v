`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Time_Counter_TB
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Time_Counter_TB ();

    reg r_Clk = 0;
    reg r_Reset = 0;
    reg r_Enable = 1;
    reg r_Seconds_Inc = 0;
    reg r_Minutes_Inc = 0;
    reg r_Hours_Inc = 0;
    wire [16:0] w_Count;
    
    Time_Counter
    #(
        .BIT_WIDTH      (17),
        .MAX_COUNT      (86400),
        .START_MINUTES  (0),
        .START_HOURS    (0)
    ) DUT (
        .i_Clk          (r_Clk),
        .i_Reset        (r_Reset),
        .i_Enable       (r_Enable),
        .i_Seconds_Inc  (r_Seconds_Inc),
        .i_Minutes_Inc  (r_Minutes_Inc),
        .i_Hours_Inc    (r_Hours_Inc),
        .o_Count        (w_Count)
    );
    
    always
        #5 r_Clk = ~r_Clk;
    
    always begin
        #95 r_Seconds_Inc = 1;
        #10 r_Seconds_Inc = 0;
        #95;
    end
    
endmodule