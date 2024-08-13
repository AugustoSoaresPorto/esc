`include "inc16.v"

module tb_inc16;
  
  reg [15:0] in_i;

  wire [15:0] out_o;
  wire carry_out;

  inc16 uut (.i(in_i), .o(out_o), .carry_out(carry_out));

  initial begin
    $display("Testbench para inc16");
    $dumpfile("signals.vcd");
    $dumpvars(0, tb_inc16);

    #0 in_i = 16'h0000;
    #10 in_i = 16'h0001;
    #10 in_i = 16'hAAAA;
    #10 in_i = 16'hFFFF;

    # 10 $finish;
  end

  // Monitor the signals
  initial begin
    $monitor("t=%03d: i=%b, o=%b, carry_out=%b", $time, in_i, out_o, carry_out);
  end

endmodule
