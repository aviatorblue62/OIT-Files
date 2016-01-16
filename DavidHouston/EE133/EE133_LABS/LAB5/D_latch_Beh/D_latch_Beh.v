module D_latch_Beh(
		input wire D,Clk,
		output reg Q);
		
		always @ (D or Clk)
			if(Clk == 1) Q = D;
			else Q = Q;
endmodule
		