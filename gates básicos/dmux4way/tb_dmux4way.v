//
// Test bench para demultiplexador de 2 saidas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "dmux4way.v"

module tb_dmux4way;
  
  // inputs
  reg in_e;
  reg [1:0] in_sel;
  // outputs
  wire out_a;
  wire out_b;
  wire out_c;
  wire out_d;

  // Instancia da UUT (Unit Under Test)
  dmux4way uut (.e(in_e), .sel(in_sel), .a(out_a), .b(out_b), .c(out_c), .d(out_d));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para demultiplexador de duas saídas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dmux4way);

    # 0 in_e = 0; in_sel = 2'b00;
    # 10 in_e = 1; in_sel = 2'b00;
    # 10 in_e = 0; in_sel = 2'b01;
    # 10 in_e = 1; in_sel = 2'b01;
    # 10 in_e = 0; in_sel = 2'b10;
    # 10 in_e = 1; in_sel = 2'b10;
    # 10 in_e = 0; in_sel = 2'b11;
    # 10 in_e = 1; in_sel = 2'b11;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \te=%d,s=%d,a=%d,b=%d,c=%d,d=%d \n",$time,in_e,in_sel,out_a,out_b,out_c,out_d);
  end

endmodule

