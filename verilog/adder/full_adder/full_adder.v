`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 03:21:04 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder (sum, cout, a, b, cin);
    output sum, cout;
    input a, b, cin;
    wire or1, and1, and2;
    
    xor #10 (sum, a, b, cin);
    or #5 (or1, b, c);
    and #5 (and1, a, or1);
    and #5 (and2, b, c);
    or #5 (cout, and1, and2);
endmodule

