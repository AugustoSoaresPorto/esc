
// modulos usados
`include "pc.v"

module tb_pc;

    // clock simulado
    reg clk;

    // sinais
    reg rst;
    reg [15:0] in;
    reg inc;
    reg load;
    wire [15:0] out;

    // Instancia da UUT (Unit Under Test)
    pc uut (.in(in),.load(load),.rst(rst),.inc(inc),.clk(clk),.out(out));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("pc");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_pc);
        clk = 0;
        in = 0;
        load = 0;
        rst = 0;
        inc = 0;

        # 1 rst = 1;
        # 1 rst = 0;
        # 1 load = 1;
        # 2 in = 0;  
        # 2 in = 1;
        # 1 inc = 1;
        # 1 load = 0;
        # 2 in = 1; 
        # 2 in = 0;
        # 1 load = 1;
        # 2 in = 1; 
        # 1 rst = 1;
        # 1 rst = 0;

        # 5 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor(in,load,rst,inc,clk,out);
    end

    // gerador de clock com bloco always de unica linha
    always 
        #1 clk = ~clk;

endmodule

