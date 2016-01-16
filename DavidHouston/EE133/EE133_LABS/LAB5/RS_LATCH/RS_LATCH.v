// <Houston & Fawver, EE 133 Lab 5, 05-06-2014>

module RS_LATCH(
		input wire R,S,CLK,
		output wire Q,nQ);
		
		wire W1,W2;
		
		assign W1 = ~(S & CLK);
		assign W2 = ~(R & CLK);
		
		assign Q = ~(W1 & nQ);
		assign nQ = ~(W2 & Q);
endmodule
		