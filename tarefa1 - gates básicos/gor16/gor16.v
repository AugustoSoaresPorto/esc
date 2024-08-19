// Gate OR combinacional de 16 bits

module gor16(input [15:0] a, input [15:0] b, output [15:0] y);
  
  assign y = a | b;

endmodule