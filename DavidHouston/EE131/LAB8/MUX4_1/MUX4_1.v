/*
Name: Houston & Segal
Date: 02-26-2014
Title: 4 to 1 Multiplexer
*/

module MUX4_1(A3,A2,A1,A0,
			  B3,B2,B1,B0,
			  C3,C2,C1,C0,
			  D3,D2,D1,D0,
			  SEL1,SEL0,
			  ALUOUT3,ALUOUT2,ALUOUT1,ALUOUT0);
			  
input A3,A2,A1,A0,
	  B3,B2,B1,B0,
	  C3,C2,C1,C0,
	  D3,D2,D1,D0,
	  SEL1,SEL0;
	  
output ALUOUT3,ALUOUT2,ALUOUT1,ALUOUT0;

assign ALUOUT3 = (~SEL1 & ~SEL0 & A3)|
				 (~SEL1 & SEL0 & B3)|
				 (SEL1 & ~SEL0 & C3)|
				 (SEL1 & SEL0 & D3);
				 
assign ALUOUT2 = (~SEL1 & ~SEL0 & A2)|
				 (~SEL1 & SEL0 & B2)|
				 (SEL1 & ~SEL0 & C2)|
				 (SEL1 & SEL0 & D2);
				 
assign ALUOUT1 = (~SEL1 & ~SEL0 & A1)|
				 (~SEL1 & SEL0 & B1)|
				 (SEL1 & ~SEL0 & C1)|
				 (SEL1 & SEL0 & D1);
				 
assign ALUOUT0 = (~SEL1 & ~SEL0 & A0)|
				 (~SEL1 & SEL0 & B0)|
				 (SEL1 & ~SEL0 & C0)|
				 (SEL1 & SEL0 & D0);

endmodule
