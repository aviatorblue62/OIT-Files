/*
Name: Houston & Segal
Date: Today
Name: Lab 5 Adder
*/

module LABADDERCPLD(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;

wire w1, w2, w3, w4;

assign sum = w1 ^ cin;
assign cout = w2 ^ w3 ^ w4;
assign w1 = a ^ b;
assign w2 = a & b;
assign w3 = b & cin;
assign w4 = cin & a;

endmodule
