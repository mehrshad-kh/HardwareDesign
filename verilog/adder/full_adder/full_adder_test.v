`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 03:31:29 PM
// Design Name: 
// Module Name: full_adder_test
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


module full_adder_test;
    reg a, b, cin;
    wire sum, cout;
    
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial
        begin
        a = 1'b0;
        b = 1'b1;
        cin = 1'b0;
        #100;
        
        a = 1'b0;
        b = 1'b1;
        cin = 1'b1;
        #100;
        
        a = 1'b1;
        b = 1'b1;
        cin = 1'b1;
        #100 $finish;
    end
endmodule
