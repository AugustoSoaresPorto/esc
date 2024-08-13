`include "hadder.v"

module add16(input [15:0] a, input [15:0] b, input carry_in, output [15:0] sum, output carry_out);
  
  wire [15:0] c;
  wire [15:0] s;

  hadder ha0(a[0], b[0], s[0], c[0]);
  hadder ha1(a[1], b[1], s[1], c[1]);
  hadder ha2(a[2], b[2], s[2], c[2]);
  hadder ha3(a[3], b[3], s[3], c[3]);
  hadder ha4(a[4], b[4], s[4], c[4]);
  hadder ha5(a[5], b[5], s[5], c[5]);
  hadder ha6(a[6], b[6], s[6], c[6]);
  hadder ha7(a[7], b[7], s[7], c[7]);
  hadder ha8(a[8], b[8], s[8], c[8]);
  hadder ha9(a[9], b[9], s[9], c[9]);
  hadder ha10(a[10], b[10], s[10], c[10]);
  hadder ha11(a[11], b[11], s[11], c[11]);
  hadder ha12(a[12], b[12], s[12], c[12]);
  hadder ha13(a[13], b[13], s[13], c[13]);
  hadder ha14(a[14], b[14], s[14], c[14]);
  hadder ha15(a[15], b[15], s[15], c[15]);

  assign sum = s ^ {c[14:0], carry_in};
  assign carry_out = c[15];

endmodule
