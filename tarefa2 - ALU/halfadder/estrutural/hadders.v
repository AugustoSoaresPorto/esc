// Meio somador de 1 bit (estrutural), reusando componentes

`include "gxor.v"
`include "gand.v"

module hadders(input a, input b, output sum, output carry_out);
  
  gxor gx(a, b, sum);
  gand ga(a, b, carry_out);

endmodule

