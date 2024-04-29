module four_to_two_priority_encoder (
	input x0,
	input x1,
	input x2,
	input x3,
	output a,
	output b,
	output v
);
	wire x2_, e;

	not x2_not(x2_, x2);
	and and1(e, x1, x2_);

	or or1(a, x2, x3);
	or or2(b, x3, e);
	or or3(v, x0, x1, x2, x3);
endmodule
