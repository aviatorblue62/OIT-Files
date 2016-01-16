/*
Lab 4
Name: David Houston/Kyle Segal
Date: 01-30-2014
Title: Basic Combintational Logic - Structural Model
*/
module LAB4GATES (A,B,C,X,Y);
input A,B,C;	//input signal names
output X, Y;	//output signal names

wire W1, W2;	//internal "net" connections

and u1 (W1, A, B);	//gate unit_name (output, input1, input2)
and u2 (W2, B, C);
or u3 (X, W1, W2);
or u4 (Y, A, C);

endmodule		//must have an "Enter" to newline
