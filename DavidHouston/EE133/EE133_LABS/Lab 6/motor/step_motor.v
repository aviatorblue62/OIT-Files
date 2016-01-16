// <Houston & Fawver, EE 133 Lab 6, 05-13-2014>

module step_motor(
	input wire rst,sen,up,dn,clk,
	output reg [3:0]Q);
	reg [3:0]count;
	
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
		begin
		count = 4'b0000;
		end
		
		else if(sen)
		begin
			if(!up & dn)
			begin
				count = count - 1;
				if(count > 4'b0111)
				count = 4'b0111;
			end
			if (up & !dn)
			begin
				count = count + 1;
				if(count > 4'b0111)
				count = 4'b0000;
			end
		end
	end
	
	always @ (count)
	begin
		
		case(count)
		4'b0000:	Q = 4'b1010;
		4'b0001:	Q = 4'b1000;
		4'b0010:	Q = 4'b1001;
		4'b0011:	Q = 4'b0001;
		4'b0100:	Q = 4'b0101;
		4'b0101:	Q = 4'b0100;
		4'b0110:	Q = 4'b0110;
		4'b0111:	Q = 4'b0010;
		default:	Q = 4'b1010;
		endcase
	end
endmodule
			