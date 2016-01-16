/*
Name: Houston/Segal
Date: 2-13-14
Lab: Verilog
*/

module LAB6 (a,b,outeq);
input [1:0] a,b;
output outeq;
assign outeq = (a[1] ~^ b[1]) & (a[0] ~^ b[0]);
endmodule
