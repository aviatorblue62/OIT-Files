// <Houston & Fawver & Patterson, EE 133 Lab 9 Ring Counter, 05-27-2014>

module ring_count(
		input wire clk,rst,rr,rl,
		output reg [3:0]Q);
		
		always @ (posedge clk or posedge rst)
		begin
			if(rst) Q = 4'b1000;
			
			else
			begin
				if(rr && rl) Q = Q;
				else if(rr) Q <= {(~|(Q[3:1])),Q[3:1]};
				else if (rl) Q <= {Q[2:0],(~|(Q[2:0]))};
			end
		end
endmodule
				
					