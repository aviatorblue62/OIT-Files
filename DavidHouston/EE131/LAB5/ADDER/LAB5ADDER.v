/*
Name: Houston & Segal
date: Today
Title: The Adder
*/
module LAB5ADDER(inA, inB, inC, out1, out2);
input inA, inB, inC;
output out1, out2;

wire w1, w2, w3;

xor u1 (w1, inA, inB);
and u2 (w2, inB, inC);
not u3 (w3, w2);
or u4 (out1, w1, w3);
or u5 (out2, w1, w2);

endmodule
