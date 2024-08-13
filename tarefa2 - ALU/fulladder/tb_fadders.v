
`include "fadders.v"

module tb_fadders;
  
  // inputs
  reg in_a;
  reg in_b;
  reg in_c;
  // outputs
  wire out_s;
  wire out_c;

  // Instancia da UUT (Unit Under Test)
  fadders uut (.a(in_a), .b(in_b), .carry_in(in_c), .sum(out_s), .carry_out(out_c));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para full adder estrutural");
    $dumpfile("signals.vcd");
    $dumpvars(0);

    # 0 in_a = 0; in_b = 0; in_c = 0;
    # 10 in_a = 0; in_b = 0; in_c = 1;
    # 10 in_a = 0; in_b = 1; in_c = 0;
    # 10 in_a = 0; in_b = 1; in_c = 1;
    # 10 in_a = 1; in_b = 0; in_c = 0;
    # 10 in_a = 1; in_b = 0; in_c = 1;
    # 10 in_a = 1; in_b = 1; in_c = 0;
    # 10 in_a = 1; in_b = 1; in_c = 1;
    
    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,b=%d,s=%d,c=%d",$time,in_a,in_b,out_s,out_c);
  end

endmodule

