//
// Multiplexador de duas entradas (1 bit), comportamental
//
module mux(
  input a,
  input b,
  input sel,
  output y);
  
  assign y = sel ? b : a;

endmodule

