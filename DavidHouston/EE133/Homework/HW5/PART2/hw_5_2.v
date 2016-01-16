// <David Houston, EE 133 HW5 Part 2, 05-27-2014>

module hw_5_2(
		input wire set,clk,clr,
		output reg [2:0]Q);
		
		parameter 	s0 = 3'b000,
					s1 = 3'b001,
					s2 = 3'b011,
					s3 = 3'b111,
					s4 = 3'b110,
					s5 = 3'b100,
					s6 = 3'b010,
					s7 = 3'b101;
					
					
		always @ (posedge clk or posedge clr)
		begin
			if (clr) Q = s0;
			
			else
			begin
				case (Q)
				s0: if(set)	
							Q = s0;
					else
							Q = s1;
				s1: if(set) 
							Q = s6;
					else 
							Q = s2;
				s2: if(set) 
							Q = s4;
					else 
							Q = s3;
				s3:			Q = s4;
				s4:			Q = s5;
				s5:			Q = s0;
				s6: if(set)
							Q = s5;
					else
							Q = s7;
				s7: 		Q = s4;
				default: 	Q = s0;  //resets to s0 if illegal input
				endcase
			end
		end
endmodule
				