`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:10 11/20/2023
// Design Name:   simple_comparator
// Module Name:   C:/Users/Admin/Desktop/mkh_hzr/comparator/simple_comparator_test.v
// Project Name:  comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: simple_comparator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:40 11/20/2023
// Design Name:   simple_comparator
// Module Name:   C:/Users/Admin/Desktop/azlogic_g7/comp3ali/simple_comparator_test.v
// Project Name:  comp3ali
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: simple_comparator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simple_comparator_test;
	reg [2:0] a;
	reg [2:0] b;

	wire lt;
	wire eq;
	wire gt;

	simple_comparator uut (
		.a(a), 
		.b(b), 
		.lt(lt), 
		.eq(eq), 
		.gt(gt)
	);

	initial 
		begin
		 a[2] = 1'b0;
		 a[1] = 1'b0;
		 a[0] = 1'b1;
		 b[2] = 1'b0;
		 b[1] = 1'b1;
		 b[0] = 1'b1;
		#100;
		
		 a[2] = 1'b1;
		 a[1] = 1'b0;
		 a[0] = 1'b1;
		 b[2] = 1'b1;
		 b[1] = 1'b0;
		 b[0] = 1'b1;
		#100;
		
		 a[2] = 1'b1;
		 a[1] = 1'b0;
		 a[0] = 1'b1;
		 b[2] = 1'b0;
		 b[1] = 1'b1;
		 b[0] = 1'b0;
		 #100 $finish;
	end   
endmodule

