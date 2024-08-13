
`include "hadders.v"

module tb_hadders;
  
  // inputs
  reg in_a;
  reg in_b;
  // outputs
  wire out_s;
  wire out_c;

  // Instancia da UUT (Unit Under Test)
  hadders uut (.a(in_a), .b(in_b), .sum(out_s), .carry_out(out_c));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para half adder estrutural");
    $dumpfile("signals.vcd");
    //$dumpvars(0,tb_hadders);
    $dumpvars(0);

    # 0 in_a = 0; in_b = 0;
    # 10 in_a = 0; in_b = 1;
    # 10 in_a = 1; in_b = 0;
    # 10 in_a = 1; in_b = 1;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,b=%d,s=%d,c=%d \n",$time,in_a,in_b,out_s,out_c);
  end

endmodule

