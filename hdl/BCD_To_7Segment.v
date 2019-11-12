`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: BCD_To_7Segment
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module BCD_To_7Segment
    (
        input        i_Clk,
        input  [3:0] i_BCD_Num,
        output [6:0] o_Segments
    );
    
    reg [6:0] r_Hex_Encoding;
    
    always @(posedge i_Clk) begin
        case (i_BCD_Num)
            4'b0000 : r_Hex_Encoding <= 7'b0000001;
            4'b0001 : r_Hex_Encoding <= 7'b1001111;
            4'b0010 : r_Hex_Encoding <= 7'b0010010;
            4'b0011 : r_Hex_Encoding <= 7'b0000110;
            4'b0100 : r_Hex_Encoding <= 7'b1001100;          
            4'b0101 : r_Hex_Encoding <= 7'b0100100;
            4'b0110 : r_Hex_Encoding <= 7'b0100000;
            4'b0111 : r_Hex_Encoding <= 7'b0001111;
            4'b1000 : r_Hex_Encoding <= 7'b0000000;
            4'b1001 : r_Hex_Encoding <= 7'b0000100;
            default : r_Hex_Encoding <= 7'b0000001;
        endcase
    end
    
    assign o_Segments[0] = r_Hex_Encoding[6];
    assign o_Segments[1] = r_Hex_Encoding[5];
    assign o_Segments[2] = r_Hex_Encoding[4];
    assign o_Segments[3] = r_Hex_Encoding[3];
    assign o_Segments[4] = r_Hex_Encoding[2];
    assign o_Segments[5] = r_Hex_Encoding[1];
    assign o_Segments[6] = r_Hex_Encoding[0];
    
endmodule