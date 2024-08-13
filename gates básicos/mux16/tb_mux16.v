//
// Test bench para multiplexador de 2 entradas (16 bits)
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "mux16.v"

module tb_mux16;
  
  // inputs
  reg [15:0] in_a;
  reg [15:0] in_b;
  reg in_sel;
  // outputs
  wire [15:0] out_y;

  // Instancia da UUT (Unit Under Test)
  mux16 uut (.a(in_a), .b(in_b), .sel(in_sel), .y(out_y));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para multiplexador de duas entradas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_mux16);

    # 0 in_a = $random; in_b = $random; in_sel = 0;
    # 10 in_a = $random; in_b = $random; in_sel = 1;
    # 10 in_a = $random; in_b = $random; in_sel = 0;
    # 10 in_a = $random; in_b = $random; in_sel = 1;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,b=%d,s=%d,y=%d \n",$time,in_a,in_b,in_sel,out_y);
  end

endmodule

