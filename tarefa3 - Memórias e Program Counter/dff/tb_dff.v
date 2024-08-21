
// modulos usados
`include "dff.v"

module tb_dff;
  
  // clock simulado
  reg clk;
  reg rst;

  // sinais
  reg d;
  wire q;
  wire qn;

  // Instancia da UUT (Unit Under Test)
  dff uut (d,clk,rst,q,qn);

   // Como os sinais irao variar durante a simulacao
  initial begin
    $display("DFF");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dff);
    clk = 0;
    rst = 0;
    d = 0;

    # 1 rst = 1;
    # 1 rst = 0; 
    # 2 d = 0;  
    # 2 d = 1; 
    # 2 d = 1; 
    # 2 d = 0; 
    # 2 d = 1; 
    # 1 rst = 1;
    # 1 rst = 0;

    # 5 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor(rst,clk,d,q,qn);
  end

 // gerador de clock com bloco always de unica linha
  always 
    #1 clk = ~clk;



endmodule

