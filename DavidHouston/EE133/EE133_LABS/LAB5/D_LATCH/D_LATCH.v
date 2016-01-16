// <Houston & Fawver, EE 133 Lab 5, 05-06-2014>

module D_LATCH(
		input wire D,CLK,
		output wire Q,nQ);
		
		wire X,Y;
		
		assign X = ~(D & CLK);
		assign Y = ~(~D & CLK);
		
		assign Q = ~(X & nQ);
		assign nQ = ~(Y & Q);
endmodule
