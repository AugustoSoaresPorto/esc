//
// Test bench para multiplexador de 4 entradas (16 bits)
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "mux4way16.v"

module tb_mux4way16;
  
  // inputs
  reg [15:0] in_a;
  reg [15:0] in_b;
  reg [15:0] in_c;
  reg [15:0] in_d;
  reg [1:0] in_sel;
  // outputs
  wire [15:0] out_y;

  // Instancia da UUT (Unit Under Test)
  mux4way16 uut (.a(in_a), .b(in_b), .c(in_c), .d(in_d), .sel(in_sel), .y(out_y));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para multiplexador de duas entradas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_mux4way16);

    # 0 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_sel = 2'b00;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_sel = 2'b01;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_sel = 2'b10;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_sel = 2'b11;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,b=%d,c=%d,d=%d,s=%d,y=%d \n",$time,in_a,in_b,in_c,in_d,in_sel,out_y);
  end

endmodule

