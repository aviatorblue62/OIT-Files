/*
Title: Homework 1
Date: 4/7/2014
Author: David M Houston
Decription: Designs a hazard free solution in structural Verilog.
*/

module EE133_HW1_D(W,X,Y,Z,F1);
	input W,X,Y,Z;
	output F1;
	
	wire W1,W2,W3,W4,W5,W6;
	
not x1 (W1,Y);
not x2 (W2,X);

and y1 (W3,W1,W2);
and y2 (W4,Y,X);
and y3 (W5,W,W1,Z);
and y4 (W6,W,Z,X);

or u1 (F1,W3,W4,W5,W6);

endmodule
