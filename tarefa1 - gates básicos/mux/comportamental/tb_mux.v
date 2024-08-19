//
// Test bench para multiplexador de 2 entradas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "mux.v"

module tb_mux;
  
  // inputs
  reg in_a;
  reg in_b;
  reg in_sel;
  // outputs
  wire out_y;

  // Instancia da UUT (Unit Under Test)
  mux uut (.a(in_a), .b(in_b), .sel(in_sel), .y(out_y));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para multiplexador de duas entradas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_mux);

    # 0 in_a = 0; in_b = 1; in_sel = 0;
    # 10 in_a = 0; in_b = 1; in_sel = 1;
    # 10 in_a = 1; in_b = 0; in_sel = 0;
    # 10 in_a = 1; in_b = 0; in_sel = 1;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,b=%d,s=%d,y=%d \n",$time,in_a,in_b,in_sel,out_y);
  end

endmodule

