//
// Somador completo de 1 bit reusando o meio somador estrutural
//
`include "hadder.v"

module fadders(input a, input b, input carry_in, output sum, output carry_out);
  
  wire s1, c1, c2;
  
  hadder h1(a, b, s1, c1);
  hadder h2(s1, carry_in, sum, c2);

  assign carry_out = c1 | c2;

endmodule

