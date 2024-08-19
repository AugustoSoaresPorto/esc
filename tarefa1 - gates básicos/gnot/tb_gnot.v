`include "gnot.v"

module tb_gnot;
  
  // inputs
  reg in_a;
  // outputs
  wire out_y;

  // Instancia da UUT (Unit Under Test)
  gnot uut (.a(in_a), .y(out_y));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para gate NOT combinacional");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_gnot);

    # 0 in_a = 0; 
    # 10 in_a = 1; 

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,y=%d\n",$time,in_a,out_y);
  end

endmodule