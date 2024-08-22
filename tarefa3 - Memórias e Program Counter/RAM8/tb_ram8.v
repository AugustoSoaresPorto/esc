
// modulos usados
`include "ram8.v"

module tb_ram8;
    // clock simulado
    reg clk;

    // sinais
    reg [2:0] in_a;
    reg [15:0] in_i;
    reg in_l;
    wire [15:0] out_o;

    // Instancia da UUT (Unit Under Test)
    ram8 uut (.address(in_a), .clk(clk), .in(in_i), .load(in_l), .out(out_o));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("ram8");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_ram8);
        clk = 0;

        in_a = 3'b000;
        in_i = 0;
        in_l = 0;

        # 0 in_i = $random; in_l = 1;  in_a = 3'b000;
        # 5 in_i = 0; in_l = 1;  in_a = 3'b000;
        # 5 in_i = $random; in_l = 1;  in_a = 3'b000;
        # 5 in_i = 0; in_l = 1;  in_a = 3'b011;
        # 5 in_i = 0; in_l = 1;  in_a = 3'b011;
        # 5 in_i = $random; in_l = 1;  in_a = 3'b111;
        # 5 in_i = 0; in_l = 1;  in_a = 3'b111;
        # 5 in_i = $random; in_l = 0;  in_a = 3'b111;

        # 5 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tclk=%d,address=%d,in=%d,load=%d,out=%d \n",$time,clk,in_a,in_i,in_l,out_o);
    end

    // gerador de clock com bloco always de unica linha
    always 
        #1 clk = ~clk;

endmodule

