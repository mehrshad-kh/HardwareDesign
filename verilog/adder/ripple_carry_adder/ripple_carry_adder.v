`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 03:25:46 PM
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(s, cout, a, b, select);
    output [3:0] s;
    output cout;
    input [3:0] a;
    input [3:0] b;
    input select;
    
    wire [3:1] c;
    wire [3:0] final_b;
    
    xor #10
        (final_b[0], b[0], select),
        (final_b[1], b[1], select),
        (final_b[2], b[2], select),
        (final_b[3], b[3], select);
        
   
    full_adder full_adder0(s[0], c[1], a[0], final_b[0], select);
    full_adder full_adder1(s[1], c[2], a[1], final_b[1], c[1]);
    full_adder full_adder2(s[2], c[3], a[2], final_b[2], c[2]);
    full_adder full_adder3(s[3], cout, a[3], final_b[3], c[3]);
endmodule

