// modulos usados
`include "ram64.v"

module tb_ram64;
    // clock simulado
    reg clk;
    
    // sinais
    reg [5:0] in_a;
    reg [15:0] in_i;
    reg in_l;
    wire [15:0] out_o;

    // Instancia da UUT (Unit Under Test)
    ram64 uut (.address(in_a), .clk(clk), .in(in_i), .load(in_l), .out(out_o));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("ram64");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_ram64);
        clk = 0;

        // Inicializando sinais
        in_a = 0;
        in_i = 0;
        in_l = 1;

        # 0 in_i = $random; in_l = 1;  in_a = 6'b000000;
        # 2 in_i = 0; in_l = 1;  in_a = 6'b000000;
        # 2 in_i = $random; in_l = 1;  in_a = 6'b000011;
        # 2 in_i = 0; in_l = 1;  in_a = 6'b000011;
        # 2 in_i = $random; in_l = 1;  in_a = 6'b000111;
        # 2 in_i = 0; in_l = 1;  in_a = 6'b000111;
        # 2 in_i = $random; in_l = 1;  in_a = 6'b111111;
        # 2 in_i = 0; in_l = 1;  in_a = 6'b111111;
        # 2 in_i = $random; in_l = 0;  in_a = 6'b111111;
        
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
