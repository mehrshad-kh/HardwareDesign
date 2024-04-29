`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:38 11/20/2023 
// Design Name: 
// Module Name:    simple_comparator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module simple_comparator(a, b, lt, eq, gt);
	input [2:0] a;
	input [2:0] b;
	output lt, eq, gt;
	
	wire [2:0] a_;
	wire [2:0] b_;
	wire [2:0] c;

	not 
		a2_not (a_[2], a[2]),
		a1_not (a_[1], a[1]),
		a0_not (a_[0], a[0]);

	not 
		b2_not (b_[2], b[2]),
		b1_not (b_[1], b[1]),
		b0_not (b_[0], b[0]);

	xnor 
		c2_xnor (c[2], a[2], b[2]),
		c1_xnor (c[1], a[1], b[1]),
		c0_xnor (c[0], a[0], b[0]);

	wire [2:0] x;
	and 
		lt_and2 (x[2], a_[2], b[2]),
		lt_and1 (x[1], c[2], a_[1], b[1]),
		lt_and0 (x[0], c[2], c[1], a_[0], b[0]);
	or lt_or (lt, x[2], x[1], x[0]);

	and eq_and (eq, c[2], c[1], c[0]);
	
	wire [2:0] y;
	and 
		gt_and2 (y[2], a[2], b_[2]),
		gt_and1 (y[1], c[2], a[1], b_[1]),
		gt_and0 (y[0], c[2], c[1], a[0], b_[0]);
	or gt_or (gt, y[2], y[1], y[0]);
endmodule

