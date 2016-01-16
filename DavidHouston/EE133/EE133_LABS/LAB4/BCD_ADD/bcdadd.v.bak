// <Houston & Fawver, EE 133 Lab 4, 04-29-2014>

module bcdadd(a,b,Sum,Cout);
	input wire [3:0]a,b;
	output [3:0]Sum,Cout;
	wire [7:0]A;

assign A = a + b;
assign {Cout,Sum} = A < 4'b1010 ? (A): (A + 4'b0110);

endmodule
