module two_to_four_decoder (
	input e,
	input a,
	input b,
	output y0,
	output y1,
	output y2,
	output y3
);
	wire a_, b_, c_;

	not a_not(a_, a);
	not b_not(b_, b);
	not c_not(c_, c);

	and and0(y0, e, a_, b_);
	and and1(y1, e, a_, b);
	and and2(y2, e, a, b_);
	and and3(y3, e, a, b);
endmodule	


