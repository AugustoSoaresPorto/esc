`include "add16.v"

module tb_add16;
  
  reg [15:0] in_a;
  reg [15:0] in_b;
  reg carry_in;

  wire [15:0] out_s;
  wire carry_out;

  add16 uut (.a(in_a), .b(in_b), .carry_in(carry_in), .sum(out_s), .carry_out(carry_out));

  initial begin
    $display("Testbench para adder de 16-bit");
    $dumpfile("signals.vcd");
    $dumpvars(0, tb_add16);

    # 0 in_a = 16'h0000; in_b = 16'h0000; carry_in = 0;
    # 10 in_a = 16'h0000; in_b = 16'h0000; carry_in = 1;
    # 10 in_a = 16'h0000; in_b = 16'h0001; carry_in = 0;
    # 10 in_a = 16'h0000; in_b = 16'h0001; carry_in = 1;
    # 10 in_a = 16'h0001; in_b = 16'h0000; carry_in = 0;
    # 10 in_a = 16'h0001; in_b = 16'h0000; carry_in = 1;
    # 10 in_a = 16'h0001; in_b = 16'h0001; carry_in = 0;
    # 10 in_a = 16'h0001; in_b = 16'h0001; carry_in = 1;
    # 10 in_a = 16'hAAAA; in_b = 16'h5555; carry_in = 0;
    # 10 in_a = 16'hAAAA; in_b = 16'h5555; carry_in = 1;
    # 10 in_a = 16'hFFFF; in_b = 16'hFFFF; carry_in = 0;
    # 10 in_a = 16'hFFFF; in_b = 16'hFFFF; carry_in = 1;
    
    # 10 $finish;
  end

  // Monitor the signals
  initial begin
    $monitor("t=%05d: a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", $time, in_a, in_b, carry_in, out_s, carry_out);
  end

endmodule
