
// modulos usados
`include "gsnand.v"

module tb_gsnand;
  
  // clock simulado
  reg clk;

  // sinais
  reg in_a;
  reg in_b;
  wire out_y;

  // Instancia da UUT (Unit Under Test)
  gsnand uut (.a(in_a), .b(in_b), .y(out_y));

   // Como os sinais irao variar durante a simulacao
  initial begin
    $display("GSNAND");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_gsnand);
    clk = 0;

    # 0 in_a = $random; in_b = $random; 
    # 5 in_a = $random; in_b = $random; 
    # 5 in_a = $random; in_b = $random; 
    # 5 in_a = $random; in_b = $random; 

    # 5 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \tclk=%d,a=%d,b=%d,y=%d \n",$time,clk,in_a,in_b,out_y);
  end

 // gerador de clock com bloco always de unica linha
  always 
    #1 clk = ~clk;



endmodule

