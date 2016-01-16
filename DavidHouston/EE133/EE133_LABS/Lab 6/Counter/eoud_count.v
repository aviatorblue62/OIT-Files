
module eoud_count(
	input wire clk,rst,cen,eo,dir,
	output reg [3:0]count);
	
	integer n;
	
	always @ (posedge clk)
	begin
		if(rst)
		begin
			if(eo) count = 4'b0001;
			else count = 4'b0000;
		end
		
		if(cen)
		begin
			if(eo)
			begin
				if(dir)
				begin
				count = count + 2;
				end
				else if(!dir)
				begin
				count = count - 2;
				end
			end
			else if(!eo)
			begin
				if(dir)
				begin
				count = count + 2;
				end
				else if(!dir)
				begin
				count = count - 2;
				end
			end
		end
	end
endmodule
