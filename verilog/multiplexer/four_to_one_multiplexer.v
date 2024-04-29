module four_to_one_multiplexer (
	input i0,
	input i1,
	input i2,
	input i3,
	input a,
	input b,
	output y
);
	wire a_, b_;
	wire e0, e1, e2, e3;

	not a_not(a_, a);
	not b_not(b_, b);

	and and0(e0, a_, b_, i0);
	and and1(e1, a_, b, i1);
	and and2(e2, a, b_, i2);
	and and3(e3, a, b, i3);

	or or1(y, e0, e1, e2, e3);
endmodule
