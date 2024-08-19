//
// Test bench para demultiplexador de 2 saidas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "dmux8way.v"

module tb_dmux8way;
  
  // inputs
  reg in_entrada;
  reg [2:0] in_sel;
  // outputs
  wire out_a;
  wire out_b;
  wire out_c;
  wire out_d;
  wire out_e;
  wire out_f;
  wire out_g;
  wire out_h;

  // Instancia da UUT (Unit Under Test)
  dmux8way uut (.entrada(in_entrada), .sel(in_sel), .a(out_a), .b(out_b), .c(out_c), .d(out_d), .e(out_e), .f(out_f), .g(out_g), .h(out_h));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para demultiplexador de duas saídas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dmux8way);

    # 0 in_entrada = 0; in_sel = $random;
    # 10 in_entrada = 1; in_sel = 3'b000;
    # 10 in_entrada = 1; in_sel = 3'b001;
    # 10 in_entrada = 1; in_sel = 3'b010;
    # 10 in_entrada = 1; in_sel = 3'b011;
    # 10 in_entrada = 1; in_sel = 3'b100;
    # 10 in_entrada = 1; in_sel = 3'b101;
    # 10 in_entrada = 1; in_sel = 3'b110;
    # 10 in_entrada = 1; in_sel = 3'b111;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \te=%d,s=%d,a=%d,b=%d,c=%d,d=%d,e=%d,f=%d,f=%d,h=%d \n",$time,in_entrada,in_sel,out_a,out_b,out_c,out_d,out_e,out_f,out_g,out_h);
  end

endmodule

