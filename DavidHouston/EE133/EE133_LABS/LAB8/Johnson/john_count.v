//

module john_count(
		input wire clk,rst,cen,u_d,
		output reg [6:0]seg,
		output reg [4:0]Q);
		
		always @ (negedge clk or posedge rst)
		begin
			if(rst) Q <= 4'd0;
			else if(cen)
			begin
				if(u_d)
				begin
					case(Q)
					5'b00000:	Q <= 5'b00001;
					5'b00001:	Q <= 5'b00011;
					5'b00011:	Q <= 5'b00111;
					5'b00111:	Q <= 5'b01111;
					5'b01111:	Q <= 5'b11111;
					5'b11111:	Q <= 5'b11110;
					5'b11110:	Q <= 5'b11100;
					5'b11100:	Q <= 5'b11000;
					5'b11000:	Q <= 5'b10000;
					5'b10000:	Q <= 5'b00000;
					default:	Q <= 5'b00000;
					endcase
				end
				else if(!u_d)
				begin
					case(Q)
					5'b00000:	Q <= 5'b10000;
					5'b00001:	Q <= 5'b00000;
					5'b00011:	Q <= 5'b00001;
					5'b00111:	Q <= 5'b00011;
					5'b01111:	Q <= 5'b00111;
					5'b11111:	Q <= 5'b01111;
					5'b11110:	Q <= 5'b11111;
					5'b11100:	Q <= 5'b11110;
					5'b11000:	Q <= 5'b11100;
					5'b10000:	Q <= 5'b11000;
					default:	Q <= 5'b00000;
					endcase
				end
			end
		end
		
		always @ (Q)
		begin
			case(Q)
			5'b00000:	seg = 7'b1111110;
			5'b00001:	seg = 7'b0110000;
			5'b00011:	seg = 7'b1101101;
			5'b00111:	seg = 7'b1111001;
			5'b01111:	seg = 7'b0110011;
			5'b11111:	seg = 7'b1011011;
			5'b11110:	seg = 7'b1011111;
			5'b11100:	seg = 7'b1110000;
			5'b11000:	seg = 7'b1111111;
			5'b10000:	seg = 7'b1111011;
			default:	seg = 7'b0000000; //turns off
			endcase
		end
endmodule	