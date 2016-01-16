//<Houston & Fawver, EE 133 Lab 4, 04-29-2014>

module BCD_to_7SEG(D,a,b,c,d,e,f,g);
	input wire [3:0]D;
	output a,b,c,d,e,f,g;
	
	assign a = (D[1]&(~D[3])) | (~D[1]&D[3]&~D[2]) | (~D[3]&D[2]&D[0]) | (~D[3]&~D[2]&~D[0]); //seg a
	assign b = (~D[3]&~D[2]) | (~D[2]&~D[1]) | (~D[3]&D[1]&D[0]) | (~D[3]&~D[1]&~D[0]); //seg b
	assign c = (~D[3]&D[2]) | (~D[2]&~D[1]) | (~D[3]&D[0]); //seg c
	assign d = (~D[2]&~D[1]&~D[0]) | (D[1]&~D[3]&~D[2]) | (~D[3]&D[1]&~D[0]) | (~D[3]&D[2]&~D[1]&D[0]) | (D[3]&~D[2]&~D[1]); //seg d
	assign e = (~D[2]&~D[1]&~D[0]) | (~D[3]&D[1]&~D[0]); //seg e
	assign f = (~D[3]&D[2]&~D[1]) | (~D[3]&D[2]&~D[0]) | (D[3]&~D[2]&~D[1]) | (~D[2]&~D[1]&~D[0]); //seg f
	assign g = (~D[3]&D[2]&~D[1]) | (D[3]&~D[2]&~D[1]) | (~D[3]&~D[2]&D[1]) | (~D[3]&D[1]&~D[0]); //seg g
	
	endmodule
	
	