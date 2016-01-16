/*
Lab7
Name: Houston/Segal
Date: 02-20-2014
Title: 4-bit AND logic function in Verilog Data Flow method
*/
module AND_4BIT(A3,A2,A1,A0,B3,B2,B1,B0,AND3,AND2,AND1,AND0);
input A3,A2,A1,A0,B3,B2,B1,B0;
output AND3,AND2,AND1,AND0;

assign AND3 = A3 & B3;
assign AND2 = A2 & B2;
assign AND1 = A1 & B1;
assign AND0 = A0 & B0;
endmodule
