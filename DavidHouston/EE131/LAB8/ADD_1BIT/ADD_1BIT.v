/*
Name: Houston & Segal
Date: 02-26-2014
Title: 1 Bit Adder
*/

module ADD_1BIT(A,B,CIN,SUM,COUT);
input A,B,CIN;
output SUM,COUT;

assign SUM = A ^ B ^ CIN;
assign COUT = A & B | B & CIN | A & CIN;

endmodule
