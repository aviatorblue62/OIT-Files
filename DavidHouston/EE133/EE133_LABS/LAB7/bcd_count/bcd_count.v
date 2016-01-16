// <Stuff>

module bcd_count(
		input wire clk,reset,cen,updn,
		output reg [6:0]seg);
		
		reg [3:0]Q;
		
		always @ (posedge clk or posedge reset)
		begin
			if(reset) Q = 4'b0000;
			else if(!cen)
			begin
				if(updn)
				begin
					if(Q < 4'b1010) Q = Q + 1;
					else Q = 4'b0000;
				end
				else
				begin
					if(Q < 4'b1010) Q = Q - 1;
					else Q = 4'b1001;
				end
			end
		end
			
		always @ (Q)
		begin
			case(Q)
			4'b0000:		seg = 7'b1111110;
			4'b0001:		seg = 7'b0110000;
			4'b0010:		seg = 7'b1101101;
			4'b0011:		seg = 7'b1111001;
			4'b0100:		seg = 7'b0110011;
			4'b0101:		seg = 7'b1011011;
			4'b0110:		seg = 7'b1011111;
			4'b0111:		seg = 7'b1110000;
			4'b1000:		seg = 7'b1111111;
			4'b1001:		seg = 7'b1111011;
			default:		seg = 7'b1111110;
			endcase
		end
endmodule
		