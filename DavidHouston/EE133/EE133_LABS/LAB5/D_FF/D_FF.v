module D_FF(
		input wire D,CLK,
		output wire Q,nQ);
		
		wire X,nCLK;
		
		assign nCLK = ~CLK;
		
		D_LATCH master (D,nCLK,X);
		D_LATCH slave (X,CLK,Q,nQ);
		
endmodule

module D_LATCH(
		input wire D,CLK,
		output wire Q,nQ);
		
		wire X,Y;
		
		assign X = ~(D & CLK);
		assign Y = ~(~D & CLK);
		
		assign Q = ~(X & nQ);
		assign nQ = ~(Y & Q);
endmodule
