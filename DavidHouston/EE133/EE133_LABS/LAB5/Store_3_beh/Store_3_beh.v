module Store_3_beh(
	input wire D,Clk,
	output wire Q1,Q2,Q3);
	
	D_latch_Beh lat (D,Clk,Q1);
	D_FF_Beh pos (D,Clk,Q2);
	D_FF_Beh neg (D,~Clk,Q3);
	
endmodule
	
module D_FF_Beh(
	input wire D,Clk,
	output reg Q);
	
	always @ (posedge Clk)
		if(Clk)
			Q = D;
endmodule


module D_latch_Beh(
		input wire D,Clk,
		output reg Q);
		
		always @ (D or Clk)
			if(Clk == 1) Q = D;
			else Q = Q;
endmodule
