// <David Houston, EE 133 HW 2, 04-18-2014>

module hw_2_2(a,ena,y);
input [1:0]a;
input ena;
output reg [3:0]y;

always @ (a or ena)
	begin
	if(!ena)
			y = 4'bzzzz;
	else
		begin
			if 		(a==4'd0)		y=4'b0001;
			
			else if (a==4'd1)		y=4'b0010;
			else if (a==4'd2)		y=4'b0100;
			else if (a==4'd3)		y=4'b1000;
			
			else					y=4'b0001; //This assumes the user doesn't know what they are doing and therefore it goes to zero
		end
	end
endmodule
