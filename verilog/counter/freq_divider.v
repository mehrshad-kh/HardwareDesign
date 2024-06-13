`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2023 05:29:37 PM
// Design Name: 
// Module Name: freq_divider
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


module freq_divider (clk_out, clk_in);
    output reg clk_out;
    input clk_in;
    
    //reg clk_out;
    
    reg [25:0] counter = 0;
    always @ (posedge clk_in)
    begin
        if (counter == 20000000 - 1)
        begin
            counter <= 0;
            clk_out <= ~clk_out;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
endmodule
