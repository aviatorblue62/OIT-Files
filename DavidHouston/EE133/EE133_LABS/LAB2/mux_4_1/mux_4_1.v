// <Mux 4_1>

module mux_4_1 (A,B,C,D,SEL,Y);

input A,B,C,D;
input wire [1:0]SEL;
output Y;

wire X[1:0];

mux_2_1 m11 (A,B,SEL[0],X[0]);
mux_2_1 m12 (C,D,SEL[0],X[1]);

mux_2_1 m2 (X[0],X[1],SEL[1],Y);

endmodule

module mux_2_1 (A,B,SEL,X);
	
	input A,B,SEL;
	output X;
	
	wire SN,W1,W2;
	
	not n1 (SN,SEL);
	
	and a1 (W1, SN, A);
	and a2 (W2, SEL, B);
	
	or o1 (X,W1,W2);

endmodule
