`timescale 1ns / 1ps

// 11: Multiply
// 10: Add
// 01: Nand
// 00: Not A

module alu (z, a, b, select);
    output [3:0] z;
    input [1:0] a;
    input [1:0] b;
    input [1:0] select;

    wire [2:0] sum;
    wire [3:0] product;
    wire [1:0] not_a_result;
    wire [1:0] nand_result;

    arithmetic_unit au (.sum(sum), .product(product), .a(a), .b(b));
    logic_unit lu (.not_a_result(not_a_result), .nand_result(nand_result), .a(a), .b(b));
    special_multiplexer multiplexer (.z(z), .i3(product), .i2(sum), .i1(nand_result), .i0(not_a_result));
endmodule
