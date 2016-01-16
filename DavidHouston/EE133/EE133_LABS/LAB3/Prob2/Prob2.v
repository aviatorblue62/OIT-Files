// <Houston/Fawver, EE 133 Lab 3 Part 2, 04-22-2014>

module Prob2 (a,ena,r,valid);

input [3:0]a;
input ena;
output [1:0]r;
output valid;

assign r = ena ? 2'b00 :
	  (a[3] ? 2'b11 : (a[2] ? 2'b10 : (a[1] ? 2'b01 : 2'b00)));
assign valid = ena ? 1'b1 : 
			 ( a[3] ? 0 : (a[2] ? 0 : (a[1] ? 0 : (a[0] ? 0 : 1)))); 
			 
endmodule
