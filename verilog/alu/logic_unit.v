`timescale 1ns / 1ps

module logic_unit (not_a_result, nand_result, a, b);
    output [1:0] not_a_result;
    output [1:0] nand_result;
    input [1:0] a;
    input [1:0] b;

    assign
        not_a_result = ~a,
        nand_result = a ~& b;
endmodule
