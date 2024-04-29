`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 04:07:37 PM
// Design Name: 
// Module Name: ripple_carry_adder_test
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


module ripple_carry_adder_test;
    reg [3:0] a;
    reg [3:0] b;
    reg select;
    
    wire [3:0] s;
    wire cout;
    
    ripple_carry_adder uut (
        .s(s),
        .cout(cout),
        .a(a),
        .b(b),
        .select(select)  
    );
    
    initial
        begin
        // 2 + 5
        a[3] = 0;
        a[2] = 0;
        a[1] = 1;
        a[0] = 0;
        b[3] = 0;
        b[2] = 1;
        b[1] = 0;
        b[0] = 1;
        select = 0;
        #100;
        
        // 2 + 4
        a[3] = 0;
        a[2] = 0;
        a[1] = 1;
        a[0] = 0;
        b[3] = 0;
        b[2] = 1;
        b[1] = 0;
        b[0] = 0;
        select = 0;
        #100;
        
        // 5 + 5
        a[3] = 0;
        a[2] = 1;
        a[1] = 0;
        a[0] = 1;
        b[3] = 0;
        b[2] = 1;
        b[1] = 0;
        b[0] = 1;
        select = 0;
        #100;
        
        // 7 - 2
        a[3] = 0;
        a[2] = 1;
        a[1] = 1;
        a[0] = 1;
        b[3] = 0;
        b[2] = 0;
        b[1] = 1;
        b[0] = 0;
        select = 1;
        #100;
        
        // 3 - 5
        a[3] = 0;
        a[2] = 0;
        a[1] = 1;
        a[0] = 1;
        b[3] = 0;
        b[2] = 1;
        b[1] = 0;
        b[0] = 1;
        #100;
        
        // 1 - 10
        a[3] = 0;
        a[2] = 0;
        a[1] = 0;
        a[0] = 1;
        b[3] = 1;
        b[2] = 0;
        b[1] = 1;
        b[0] = 0;
        #100 $finish;  
    end
endmodule


