`timescale 1ns / 1ps

module arithmetic_unit (sum, product, a, b);
    output [2:0] sum;
    output [3:0] product;
    input [1:0] a;
    input [1:0] b;

    adder my_adder (sum, a, b);
    multiplier my_multiplier (product, a, b);
endmodule
