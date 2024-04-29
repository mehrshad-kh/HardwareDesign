`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:35:52 12/04/2023
// Design Name:   alu
// Module Name:   C:/Users/Admin/Desktop/mkh_hzr/ALU2/alu_test.v
// Project Name:  ALU2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;
	reg [1:0] a;
	reg [1:0] b;
	reg [1:0] select;

	wire [3:0] z;

	alu uut (
		.z(z), 
		.a(a), 
		.b(b), 
		.select(select)
	);

	initial 
	begin
		a[1] = 1;
		a[0] = 1;
		b[1] = 1;
		b[0] = 1;
		select[1] = 1;
		select[0] = 1;
		#100;
		
		select[1] = 1;
		select[0] = 0;
		#100;
		
		select[1] = 0;
		select[0] = 1;
		#100;
		
		select[1] = 0;
		select[0] = 0;
		#100 $finish;
	end
endmodule

