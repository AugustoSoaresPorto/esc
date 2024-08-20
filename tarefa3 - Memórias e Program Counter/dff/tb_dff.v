
// modulos usados
`include "dff.v"

module tb_dff;
    // clock simulado
    reg clk;

    // sinais
    reg in_d;
    wire out_q;
    wire out_nq;

    // Instancia da UUT (Unit Under Test)
    dff uut (.d(in_d), .q(out_q), .nq(out_nq));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("dff");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_dff);
        clk = 0;

        in_d = 0;

        # 0 in_d = 1; 
        # 5 in_d = 0; 
        # 5 in_d = 1; 
        # 5 in_d = 0;
        # 5 in_d = 1; 

        # 5 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tclk=%d,d=%d,q=%d,nq=%d \n",$time,clk,in_d,out_q,out_nq);
    end

    // gerador de clock com bloco always de unica linha
    always 
        #1 clk = ~clk;

endmodule

