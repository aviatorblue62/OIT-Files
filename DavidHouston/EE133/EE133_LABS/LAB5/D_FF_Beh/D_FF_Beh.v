module D_FF_Beh(
	input wire D,Clk,
	output reg Q);
	
	always @ (posedge Clk)
		if(Clk)
			Q = D;
endmodule
