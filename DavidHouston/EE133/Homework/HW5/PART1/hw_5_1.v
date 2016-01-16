// <David Houston, EE 133 HW 5 Part 1, 05-27-2014>


module hw_5_1 (
		input wire up_dn,hold,reset,clock,
		output reg [4:0]cnt);
		
		reg [3:0]count;
		parameter 	s0 = 5'b00000,
					s1 = 5'b00001,
					s2 = 5'b00011,
					s3 = 5'b00111,
					s4 = 5'b01111,
					s5 = 5'b11111,
					s6 = 5'b11110,
					s7 = 5'b11100,
					s8 = 5'b11000,
					s9 = 5'b10000;  
		
		always @ (posedge clock or posedge reset)
		begin
			if(reset) count = 4'd0;
			else if(hold) count = count;
			else if(!hold)
			begin
				if(up_dn) 
				begin
					if(count < 4'd9)	count = count + 1; //counts up
					else count = 4'd0;
				end
				else 
				begin
					if(count <= 4'd0) count = 4'd9;
					else if (count <= 4'd9) count = count - 1; //counts down
				end
			end
		end
		
		always @ (count)
		begin
			case(count)
			4'd0:		cnt = s0;
			4'd1:		cnt = s1;
			4'd2:		cnt = s2;
			4'd3:		cnt = s3;
			4'd4:		cnt = s4;
			4'd5:		cnt = s5;
			4'd6:		cnt = s6;
			4'd7:		cnt = s7;
			4'd8:		cnt = s8;
			4'd9:		cnt = s9;	
			default:	cnt = s0;  //if illegal value is entered it goes back to the initial state
			endcase
		end
endmodule
		
		