// <David Houston, EE 133 HW 4 Part 2, 05-12-2014>

module hw_4_2 (data,clock,clear,load,count_on,up,down,cnt);
		input [3:0]data;
		input clock,clear,load,count_on,up,down;
		output reg [3:0]cnt;
			
			always @ (posedge load or posedge clear or posedge clock)
			begin
					if (load)
						cnt = data;
					else if (clear)
						cnt = 4'b0000;
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
					
