`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2023 05:38:05 PM
// Design Name: 
// Module Name: bcd_to_seven_seg
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


module bcd_to_seven_seg(seg_sel, seg_data, a);
    output [4:0] seg_sel;
    output reg [7:0] seg_data;
    input [2:0] a;
    
    always @ (a)
    begin
        case (a)
        3'b000: seg_data = 8'b01111111;
        3'b001: seg_data = 8'b00000110;
        3'b010: seg_data = 8'b01011011;
        3'b011: seg_data = 8'b01001111;
        3'b100: seg_data = 8'b01100110;
        3'b101: seg_data = 8'b01101101;
        3'b110: seg_data = 8'b01111101;
        3'b111: seg_data = 8'b00000111;
        endcase
    end
    
    assign seg_sel = 5'b00001;
endmodule
