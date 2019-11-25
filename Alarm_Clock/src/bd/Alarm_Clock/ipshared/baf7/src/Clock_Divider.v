`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Clock_Divider
// Description: Divides the input clock and outputs the desired output clock.
//////////////////////////////////////////////////////////////////////////////////

module Clock_Divider
    #(
        parameter CLK_IN = 1,
        parameter CLK_OUT = 1
    ) (
        input i_Clk,
        input i_Reset,
        output o_Clk
    );
    
    reg r_Clk = 0;
    integer r_Counter = 0;
    
    always @(posedge i_Clk or posedge i_Reset) begin
        if (i_Reset) begin
            r_Clk <= 0;
            r_Counter <= 0;
        end
        else begin
            if (r_Counter == (CLK_IN/CLK_OUT)/2 - 1) begin
                r_Clk <= ~r_Clk;
                r_Counter <= 0;
            end
            else
                r_Counter <= r_Counter + 1;
        end
    end
    
    assign o_Clk = r_Clk;
    
endmodule