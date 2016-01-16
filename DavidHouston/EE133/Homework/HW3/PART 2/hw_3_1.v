// <David Houston, EE 133 HW 4, 05-03-2014>

module hw_3_1 (
		input wire [3:0]a,b,
		input wire [2:0]select,
		output reg [4:0]fout);
		
		always @ (a or b or select)
		begin
			fout = 5'h0;
			if(select == 3'b000)
					fout = a > b;
			else if(select == 3'b001)
					fout = b > a;
			else if(select == 3'b010)
			begin
					if(a == 4'b0000 | a == 4'b1111) fout = a;
					else
					begin
						fout = a << 1;
						fout[0] = a[3];
						fout[4] = 1'b0;
					end		
			end			
			else if(select == 3'b011)
			begin
					if(a == 4'b0000 | a == 4'b1111) fout = a;
					else
					begin
						fout = a >> 1;
						fout[3] = a[0];
						fout[4] = 1'b0;
					end
			end
			else if(select == 3'b100)		
					fout = a + b;
			else if(select == 3'b101)		
					fout = a - b;
			else if(select == 3'b110)
			begin	
					fout = b << 1;
					fout[4] = 0;
			end
			else if(select == 3'b111)		
					fout = b >> 1;
			else						
					fout = 5'bzzzzz;
		end
endmodule
