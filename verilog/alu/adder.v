`timescale 1ns / 1ps

module adder (sum, a, b);
    output [2:0] sum;
    input [1:0] a;
    input [1:0] b;
    
    assign sum = a + b;
endmodule
