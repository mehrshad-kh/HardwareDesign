`timescale 1ns / 1ps


module jk_flip_flop(q, q_not, j, k, clk);
    output q, q_not;
    input j, k, clk;
     reg q = 1'b0;
   
    assign q_not = ~q;
    always @ (negedge clk)
        case ({j, k})
            2'b00:
                q = q;
            2'b01:
                q = 0;
            2'b10:
                q = 1;
            2'b11:
                q = ~q;
        endcase
endmodule
