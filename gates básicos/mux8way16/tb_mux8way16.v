//
// Test bench para multiplexador de 8 entradas (16 bits)
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "mux8way16.v"

module tb_mux8way16;
  
  // inputs
  reg [15:0] in_a;
  reg [15:0] in_b;
  reg [15:0] in_c;
  reg [15:0] in_d;
  reg [15:0] in_e;
  reg [15:0] in_f;
  reg [15:0] in_g;
  reg [15:0] in_h;
  reg [2:0] in_sel;
  // outputs
  wire [15:0] out_y;

  // Instancia da UUT (Unit Under Test)
  mux8way16 uut (.a(in_a), .b(in_b), .c(in_c), .d(in_d), .e(in_e), .f(in_f), .g(in_g), .h(in_h), .sel(in_sel), .y(out_y));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para multiplexador de duas entradas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_mux8way16);

    # 0 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_e = $random; in_f = $random; in_g = $random; in_h = $random; in_sel = 3'b000;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_e = $random; in_f = $random; in_g = $random; in_h = $random; in_sel = 3'b001;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_e = $random; in_f = $random; in_g = $random; in_h = $random; in_sel = 3'b010;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_e = $random; in_f = $random; in_g = $random; in_h = $random; in_sel = 3'b011;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_e = $random; in_f = $random; in_g = $random; in_h = $random; in_sel = 3'b100;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_e = $random; in_f = $random; in_g = $random; in_h = $random; in_sel = 3'b101;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_e = $random; in_f = $random; in_g = $random; in_h = $random; in_sel = 3'b110;
    # 10 in_a = $random; in_b = $random; in_c = $random; in_d = $random; in_e = $random; in_f = $random; in_g = $random; in_h = $random; in_sel = 3'b111;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,b=%d,c=%d,d=%d,e=%d,f=%d,g=%d,h=%d,s=%d,y=%d \n",$time,in_a,in_b,in_c,in_d,in_e,in_f,in_g,in_h,in_sel,out_y);
  end

endmodule

