//
// Multiplexador de duas entradas (1 bit), estrutural
//
//  y = a*!sel + b*sel
//
// https://www.chipverify.com/verilog/verilog-gate-level-modeling

module muxs(input a, input b, input sel, output y);
  
  wire nsel;
  wire wa;
  wire wb;

  not(nsel, sel);
  and(wa, a, nsel);
  and(wb, b, sel);
  or(y, wa, wb);

endmodule

