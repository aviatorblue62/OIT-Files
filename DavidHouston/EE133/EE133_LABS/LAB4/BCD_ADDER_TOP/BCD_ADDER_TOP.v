//<Houston & Fawver, EE 133 Lab 4, 04-29-2014>

module BCD_ADDER_TOP(a,b,seg1,seg2);
	input [3:0]a,b;
	output [6:0]seg1,seg2;
	
	wire [3:0]s,cout;
	
	bcdadd add (a,b,s,cout);
	
	BCD_to_7SEG u1 (s,seg1);
	BCD_to_7SEG u2 (cout,seg2);
	
endmodule


module BCD_to_7SEG(D,seg);
	input wire [3:0]D;
	output [6:0]seg;
	
	assign seg[0] = (D[1]&(~D[3])) | (~D[1]&D[3]&~D[2]) | (~D[3]&D[2]&D[0]) | (~D[3]&~D[2]&~D[0]); //seg a
	assign seg[1] = (~D[3]&~D[2]) | (~D[2]&~D[1]) | (~D[3]&D[1]&D[0]) | (~D[3]&~D[1]&~D[0]); //seg b
	assign seg[2] = (~D[3]&D[2]) | (~D[2]&~D[1]) | (~D[3]&D[0]); //seg c
	assign seg[3]= (~D[2]&~D[1]&~D[0]) | (D[1]&~D[3]&~D[2]) | (~D[3]&D[1]&~D[0]) | (~D[3]&D[2]&~D[1]&D[0]) | (D[3]&~D[2]&~D[1]); //seg d
	assign seg[4] = (~D[2]&~D[1]&~D[0]) | (~D[3]&D[1]&~D[0]); //seg e
	assign seg[5] = (~D[3]&D[2]&~D[1]) | (~D[3]&D[2]&~D[0]) | (D[3]&~D[2]&~D[1]) | (~D[2]&~D[1]&~D[0]); //seg f
	assign seg[6] = (~D[3]&D[2]&~D[1]) | (D[3]&~D[2]&~D[1]) | (~D[3]&~D[2]&D[1]) | (~D[3]&D[1]&~D[0]); //seg g
	
	endmodule

module bcdadd(a,b,Sum,Cout);
	input wire [3:0]a,b;
	output [3:0]Sum,Cout;
	wire [7:0]temp;

	assign temp = a + b;
	assign {Cout,Sum} = temp < 4'b1010 ? (temp): (temp + 4'b0110);

endmodule
