/*
Lab 7
Name: Houston/Segal
Date: 02-20-2014
Title: 4-bit OR logic function in Verilog Data Flow method
*/

module OR_4BIT(A3,A2,A1,A0,B3,B2,B1,B0,OR3,OR2,OR1,OR0);
input A3,A2,A1,A0,B3,B2,B1,B0;
output OR3,OR2,OR1,OR0;

assign OR3 = A3 | B3;
assign OR2 = A2 | B2;
assign OR1 = A1 | B1;
assign OR0 = A0 | B0;

endmodule
