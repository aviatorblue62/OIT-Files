/*
Name: Houston & Segal
Date: 02-27-2014
Title: 2 to 1 Multiplexer
*/

module MUX2_1(A1,A0,B1,B0,SEL0,COUT,OVR);
input A1,A0,B1,B0,SEL0;
output COUT,OVR;

assign COUT = (~SEL0)&(A1)|(SEL0)&(B1);
assign OVR = (~SEL0)&(A0)|(SEL0)&(B0);
endmodule
