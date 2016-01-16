// Mux 4bit 4-1

module mux_4bit_4_1 (A,B,C,D,SEL1,SEL2,M);

input [3:0]A;
input [3:0]B;
input [3:0]C;
input [3:0]D;
input SEL1,SEL2;
output [3:0]M;

mux_4_1 m1 (A[3],B[3],C[3],D[3],SEL1,SEL2,M[3]);
mux_4_1 m2 (A[2],B[2],C[2],D[2],SEL1,SEL2,M[2]);
mux_4_1 m3 (A[1],B[1],C[1],D[1],SEL1,SEL2,M[1]);
mux_4_1 m4 (A[0],B[0],C[0],D[0],SEL1,SEL2,M[0]);

endmodule

module mux_4_1 (A,B,C,D,SEL1,SEL2,Y);

input A,B,C,D;
input SEL1, SEL2;
output Y;

wire X[1:0];

mux_2_1 m11 (A,B,SEL1,X[0]);
mux_2_1 m12 (C,D,SEL1,X[1]);

mux_2_1 m2 (X[0],X[1],SEL2,Y);

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
