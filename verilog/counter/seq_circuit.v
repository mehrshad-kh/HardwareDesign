`timescale 1ns / 1ps



module seq_circuit(seg_sel, seg_data, q2, q1, q0, ud, clk);
    output [4:0] seg_sel;
    output [7:0] seg_data;
    output  q2;
    output  q1;
    output  q0;
    input ud, clk;
    wire q0_not;
    wire ud_not;
    wire s, r;
    wire s_twin, r_twin;
    wire o1, o2;
    wire q1_not;
    wire q2_not;
    
    wire one;
    assign one = 1;
    
    // Poss. Prob.
    wire final_clk;
    freq_divider divider (.clk_out(final_clk), .clk_in(clk));
    
    jk_flip_flop flip_flop1 (.q(q0), .q_not(q0_not), .j(one), .k(one), .clk(final_clk));
    
    not not1 (ud_not, ud);
    and and1 (s, ud, q0), and2 (s_twin, q0_not, ud_not);
    or or1 (o1, s, s_twin);
    
    jk_flip_flop flip_flop2 (.q(q1), .q_not(q1_not), .j(o1), .k(o1), .clk(final_clk));
    
    and and3 (r_twin, s, q1), and4(r, q1_not, s_twin);
    or or2 (o2, r, r_twin);
    
    jk_flip_flop flip_flop3 (.q(q2), .q_not(q2_not), .j(o2), .k(o2), .clk(final_clk));
    
    bcd_to_seven_seg converter (.seg_sel(seg_sel), .seg_data(seg_data), .a({q2, q1, q0}));
    
 endmodule
