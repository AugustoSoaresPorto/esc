//
// Test bench para demultiplexador de 2 saidas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "dmux.v"

module tb_dmux;
  
  // inputs
  reg in_e;
  reg in_sel;
  // outputs
  wire out_a;
  wire out_b;

  // Instancia da UUT (Unit Under Test)
  dmux uut (.e(in_e), .sel(in_sel), .a(out_a), .b(out_b));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para demultiplexador de duas saídas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dmux);

    # 0 in_e = 0; in_sel = 0;
    # 10 in_e = 0; in_sel = 1;
    # 10 in_e = 1; in_sel = 0;
    # 10 in_e = 1; in_sel = 1;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \te=%d,s=%d,a=%d,b=%d \n",$time,in_e,in_sel,out_a,out_b);
  end

endmodule

