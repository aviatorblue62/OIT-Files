/*
Lab 7
Date: 02-20-2014
Title: 2 to 4 Decoder with Enable
*/

module DECODER2_4(S1,S0,EN,Y3,Y2,Y1,Y0);
input S1,S0,EN;
output Y3,Y2,Y1,Y0;
assign Y3 = EN & S1 & S0;
assign Y2 = EN & S1 & ~S0;
assign Y1 = EN & ~S1 & S0;
assign Y0 = EN & ~S1 & ~S0;
endmodule
