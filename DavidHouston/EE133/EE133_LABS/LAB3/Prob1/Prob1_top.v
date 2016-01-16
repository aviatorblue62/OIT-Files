// <David Houston, EE 133 Lab 3 Part 1, 04-22-2014>

module Prob1_top(a,ena,p,y);

input [1:0]a;
input ena, p;
output [3:0]y;

wire [3:0]x,z;

Decoder2to4 d1 (a,x);
ActiveLowConv a1 (p,x,z);
TriStateOut t1 (ena,z,y);

endmodule

module Decoder2to4(a,y);

input [1:0]a;
output [3:0]y;

assign y[0] = ~a[1] & ~a[0];
assign y[1] = ~a[1] & a[0];
assign y[2] = a[1] & ~a[0];
assign y[3] = a[1] & a[0];

endmodule

module ActiveLowConv(p,x,y);

input [0:3]x;
input p;
output [3:0]y;

assign y = p ? ~x : x;

endmodule

module TriStateOut(ena,x,y);
  
  input ena;
  input [3:0]x;
  output [3:0]y;
  
  assign y = ena ? 4'bzzz : x;
  
endmodule
			
			
  