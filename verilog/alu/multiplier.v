`timescale 1ns / 1ps

module multiplier (product, a, b);
    output [3:0] product;
    input [1:0] a;
    input [1:0] b;

    assign product = a * b;
endmodule
