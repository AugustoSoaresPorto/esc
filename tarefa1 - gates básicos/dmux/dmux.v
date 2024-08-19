//
// Demultiplexador de 1 bit, estrutural
//

module dmux(input sel, input e, output a, output b);
  
  wire nsel;

  not(nsel, sel);
  and(a, e, nsel);
  and(b, e, sel);

endmodule