`include "gor16.v"

module tb_gor16;
  
  // inputs
  reg [15:0] in_a;
  reg [15:0] in_b;
  // outputs
  wire [15:0] out_y;

  // Instancia da UUT (Unit Under Test)
  gor16 uut (.a(in_a), .b(in_b), .y(out_y));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para gate OR combinacional");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_gor16);

    # 0 in_a = 16'b0000000000000000; in_b = 16'b0000000000000000;
    # 10 in_a = 16'b0000000000000000; in_b = $random;
    # 10 in_a = $random; in_b = 16'b0000000000000000;
    # 10 in_a = $random; in_b = $random;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,b=%d,y=%d\n",$time,in_a,in_b,out_y);
  end

endmodule