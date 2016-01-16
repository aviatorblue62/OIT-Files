// <David Houston, EE 133 Lab 2, 04-15-14>

module mux_2_1 (A,B,SEL,X);
	
	input A,B,SEL;
	output X;
	
	wire SN,W1,W2;
	
	not n1 (SN,SEL);
	
	and a1 (W1, SN, A);
	and a2 (W2, SEL, B);
	
	or o1 (X,W1,W2);

endmodule