// <David Houston, EE 133 HW 4 Part 2, 05-12-2014>

module hw_4_2 (
			input wire [3:0]data,
			input wire clock, clear, load, count_on, up, down,
			output reg [3:0]cnt);
			
			always @ (posedge clock)
			begin
					if (clear)
						cnt = 4'b0000;
					else if (load)
						cnt = data;
					else if (count_on == 1'b1)
					begin
						if (up == 1'b1)
							cnt = cnt + 1;
						else if (down == 1'b1)
							cnt = cnt - 1;
// If the user doesn't count up or down then it stays the same
					end
			end
endmodule
					
