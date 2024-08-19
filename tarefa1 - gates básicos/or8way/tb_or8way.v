`include "or8way.v"

module tb_or8way;
  
  // inputs
  reg [7:0] in_a;
  // outputs
  wire out_y;

  // Instancia da UUT (Unit Under Test)
  or8way uut (.a(in_a), .y(out_y));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para gate OR combinacional");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_or8way);

    # 0 in_a = 8'b00000000;
    # 10 in_a = 8'b00000001;
    # 10 in_a = 8'b01010101;
    # 10 in_a = 8'b00001111;
    # 10 in_a = 8'b11111111;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%02d: \ta=%d,y=%d\n",$time,in_a,out_y);
  end

endmodule