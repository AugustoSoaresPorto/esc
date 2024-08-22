
// modulos usados
`include "register.v"

module tb_register;
    // clock simulado
    reg clk;

    // sinais
    reg [15:0] in_i;
    reg in_l;
    wire [15:0] out_o;

    // Instancia da UUT (Unit Under Test)
    register uut (.in(in_i), .clk(clk), .load(in_l), .out(out_o));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("register");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_register);
        clk = 0;

        in_i = 0;
        in_l = 0;

        # 0 in_i = $random; in_l = 0; 
        # 5 in_i = 0; in_l = 0; 
        # 5 in_i = $random; in_l = 1; 
        # 5 in_i = 0; in_l = 1;
        # 5 in_i = 0; in_l = 1; 
        # 5 in_i = $random; in_l = 1; 
        # 5 in_i = 0; in_l = 0;
        # 5 in_i = $random; in_l = 0;  

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

