`timescale 1ns / 1ps

// i3: 4
// i2: 3
// i1: 2
// i0: 2
module special_multiplexer (z, i3, i2, i1, i0, select);
    output [3:0] z;
    input [3:0] i3;
    input [2:0] i2;
    input [1:0] i1;
    input [1:0] i0;
    input [1:0] select;

    assign z = (select[1] == 0 ? (select[0] == 0 ? {0, 0, i0} : {0, 0, i1}) : (select[0] == 0 ? {0, i2} : i3));
endmodule
