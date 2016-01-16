// <David Houston, EE 133, HW 1>
//Ustilizing 2-1 Mux's to make a 8-1 Mux

module mux_8_1(a,b,c,d,e,f,g,h,Sel,mux81out);

	input a,b,c,d,e,f,g,h;
	input [2:0] Sel;
	output mux81out;
	
	
	wire X[3:0],Y[1:0];
	
	mux2_1 m11 (a,b,Sel[0],X[0]);
	mux2_1 m12 (c,d,Sel[0],X[1]);
	mux2_1 m13 (e,f,Sel[0],X[2]);
	mux2_1 m14 (g,h,Sel[0],X[3]);
	
	mux2_1 m21 (X[0],X[1],Sel[1],Y[0]);
	mux2_1 m22 (X[2],X[3],Sel[1],Y[1]);
	
	mux2_1 m31 (Y[0],Y[1],Sel[2],mux81out);
	
endmodule

module mux2_1(a,b,sel,f);

input a,b,sel;
output f;
		
wire W1,W2,W3;

not n1 (W1,sel);
and a1 (W2,a,W1);
and a2 (W3,b,sel);
or o1 (f,W2,W3);
endmodule
