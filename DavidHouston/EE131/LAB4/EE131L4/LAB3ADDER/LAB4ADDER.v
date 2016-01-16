/* 
Lab 4
Name: David Houston/Kyle Segal
Date: 01-30-2014
Title: Adder
*/

module LAB4ADDER (A,B,CIN,SUM,COUT);
input A, B, CIN;	//inputs
output SUM, COUT;	//outputs

wire W1, W2, W3, W4;	//wires

xor u1 (W1, A, B);	//GATES 
xor u2 (SUM, W1, CIN);

and u3 (W2, A, B);
and u4 (W3, B, CIN);
and u5 (W4, A, CIN);

or u6 (COUT, W2, W3, W4);

endmodule
