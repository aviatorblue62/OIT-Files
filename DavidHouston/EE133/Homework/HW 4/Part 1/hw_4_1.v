// <David Houston, EE 133 HW 4 Part 1, 05-12-2014>

module hw_4_1 (
			input wire [3:0]data,
			input wire load,clear,clock,
			output reg [0:3]areg);
			
			always @ (posedge clock or posedge clear)
			begin
				if(clear)
					areg = 4'b0000;
				else if (load)
					areg = data;
			end
endmodule
