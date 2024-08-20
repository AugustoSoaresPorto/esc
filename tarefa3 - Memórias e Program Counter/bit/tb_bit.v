
// modulos usados
`include "bit.v"

module tb_bit;
    // clock simulado
    reg clk;

    // sinais
    reg in_i;
    reg in_l;
    wire out_o;

    // Instancia da UUT (Unit Under Test)
    bit uut (.in(in_i), .load(in_l), .out(out_o));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("bit");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_bit);
        clk = 0;

        in_i = 0;
        in_l = 0;

        # 0 in_i = 1; in_l = 0; 
        # 5 in_i = 0; in_l = 0; 
        # 5 in_i = 1; in_l = 1; 
        # 5 in_i = 0; in_l = 1;
        # 5 in_i = 0; in_l = 1; 
        # 5 in_i = 1; in_l = 1; 
        # 5 in_i = 0; in_l = 0;
        # 5 in_i = 1; in_l = 0;  

        # 5 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tclk=%d,in=%d,load=%d,out=%d \n",$time,clk,in_i,in_l,out_o);
    end

    // gerador de clock com bloco always de unica linha
    always 
        #1 clk = ~clk;

endmodule

