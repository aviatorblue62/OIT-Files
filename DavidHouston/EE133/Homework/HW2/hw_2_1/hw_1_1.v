// <David Houston, EE 133 HW 2, 04-18-2014>

module hw_1_1(a,y);
input [3:0]a;
output [3:0]y;

assign y[3] = a[3];
assign y[2] = a[2]^a[3];
assign y[1] = a[1]^a[2];
assign y[0] = a[0]^a[1];

endmodule
