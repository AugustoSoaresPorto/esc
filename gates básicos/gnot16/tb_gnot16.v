`include "gnot16.v"

module tb_gnot16;
  
  // inputs
  reg [15:0] in_a;
  // outputs
  wire [15:0] out_y;

  // Instancia da UUT (Unit Under Test)
  gnot16 uut (.a(in_a), .y(out_y));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para gate NOT combinacional");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_gnot16);

    # 0 in_a = 16'b0000000000000000; 
    # 10 in_a = 16'b0000000000000001; 
    # 10 in_a = 16'b0101010101010101; 
    # 10 in_a = 16'b0000000111111111;
    # 10 in_a = 16'b1111111111111111; 
    # 10 in_a = $random; 

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,y=%d\n",$time,in_a,out_y);
  end

endmodule