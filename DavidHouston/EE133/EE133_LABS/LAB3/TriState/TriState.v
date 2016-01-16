module TriState(ena,x,y);
  
  input ena;
  input [3:0]x;
  output [3:0]y;
  
  assign y = ena ? 4'bzzz : x;
  
endmodule
