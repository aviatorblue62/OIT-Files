/*
Lab 7
Name: Houston/Segal
Date: 02-20-2014
Title: 4 to 2 Binary Encoder
*/

module ENCODER4_2(I3,I2,I1,I0,Y1,Y0);
input I3,I2,I1,I0;
output Y1,Y0;

assign Y1 = (~I3 & I2 & ~I1 & ~I0) | (I3 & ~I2 & ~I1 & ~I0);
assign Y0 = (~I3 & ~I2 & I1 & ~I0) | (I3 & ~I2 & ~I1 & ~I0);

endmodule
