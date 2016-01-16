// <Houston & Fawver, EE 133 Lab7 Part 2, 05-20-2014>

module b_count(
	input wire reset,load,up_dn,clk,
	input wire [7:0]D,
	output reg [7:0]Q);
	
	always @ (posedge clk)
	begin
		if(reset) {Q} = 8'd0;
		else if(load) Q = D;
		else
		begin
			if (up_dn) Q = Q - 1;
			else Q = Q + 1;
		end
	end
endmodule
