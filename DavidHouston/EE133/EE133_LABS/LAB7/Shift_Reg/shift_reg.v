// <Houston & Fawver, EE 133 LAB7 Part 1, 05-20-2014>

module shift_reg (
	input wire [3:0]D,
	input wire S_in,load,l_r,clk,reset,
	output reg [3:0]Q,
	output reg S_out);
	
	always @ (posedge clk or posedge reset)
	begin
		if(reset) {Q,S_out} = 5'b00000;
		else if (load) Q = D;
		else if (!load)
		begin
			if(l_r) {Q[3:0],S_out} = {Q[2:0],S_in,Q[3]};
			else {Q[3:0],S_out} = {S_in,Q[3:0]};
		end
	end
endmodule