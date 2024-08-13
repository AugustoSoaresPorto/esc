module inc16 (
  input [15:0] i,       
  output [15:0] o,    
  output carry_out     
);

  assign {carry_out, o} = i + 16'b1;

endmodule