`timescale 1ns / 1ps

module register (out, enable, in, clock);
    output reg [3:0] out;
    input enable;
    input [3:0] in;
    input clock;
    
    always @ (posedge clock or negedge enable)
    begin
        if (~enable)
        begin
            out = 4'b0000;
        end
        else
        begin
            out[3] = in[3];
            out[2] = in[2];
            out[1] = in[1];
            out[0] = in[0];
        end
    end
endmodule
