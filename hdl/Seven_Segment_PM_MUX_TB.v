`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven_Segment_PM_MUX_TB
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Seven_Segment_PM_MUX_TB ();

    reg r_Clk_100MHz = 0;
    reg r_Display_Sel = 0;
    reg [15:0] r_Time = 0;
    reg [15:0] r_Alarm_Time = 0;
    reg r_Time_PM = 0;
    reg r_Alarm_PM = 0;
    wire [15:0] w_Display_Time;
    wire w_Display_PM;
    
    Seven_Segment_PM_MUX
    #(
        .DECIMAL_DIGITS     (4)
    ) DUT (
        .i_Clk              (r_Clk_100MHz),
        .i_Display_Sel      (r_Display_Sel),
        .i_Time             (r_Time),
        .i_Alarm_Time       (r_Alarm_Time),
        .i_Time_PM          (r_Time_PM),
        .i_Alarm_PM         (r_Alarm_PM),
        .o_Display_Time     (w_Display_Time),
        .o_Display_PM       (w_Display_PM)
    );
    
    initial begin
        r_Display_Sel = 1;
        r_Time = 16'b0001001000101000;
        r_Alarm_Time = 16'b0000010100010110;
        r_Time_PM = 0;
        r_Alarm_PM = 1;
        
        #1000 r_Display_Sel = 0;
        r_Time = 16'b0001000101000100;
        r_Alarm_Time = 16'b0000100101010011;
    end
    
    always
        #5 r_Clk_100MHz = ~r_Clk_100MHz;
    
endmodule