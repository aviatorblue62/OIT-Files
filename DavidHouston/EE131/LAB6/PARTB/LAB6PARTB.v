/*
Name: Houston & Segal
Pate: 2-13-14
Lab 6 Part B
*/

module LAB6PARTB (a,b,outeq);
input [1:0] a,b;
output reg outeq;
always@(a,b)
	if(a==b)
		outeq <= 1;
	else
		outeq <= 0;
endmodule