/*
Name: Kyle & David
Date: Today
Title: Verilog Data Flow Model
*/

module LAB5DATAFLOW(IN_A, IN_B, IN_SEL, OUT_DF);
input IN_A, IN_B, IN_SEL;
output OUT_DF;

wire W1, W2, W3;

assign OUT_DF = W2|W3;
assign W1 = ~IN_SEL;
assign W2 = IN_A & W1;
assign W3 = IN_SEL & IN_B;

endmodule
