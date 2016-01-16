module ActiveLowConv(p,x,y);

input [0:3]x;
input p;
output [3:0]y;

assign y = p ? ~x : x;

endmodule
