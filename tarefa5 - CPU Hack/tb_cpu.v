`include "cpu.v"

module tb_cpu;
    reg clk;
    reg [15:0] inM;
    reg [15:0] instruction;
    reg reset;
    wire [15:0] outM;
    wire writeM;
    wire [15:0] addressM;
    wire [15:0] pc;

    // Instanciando a CPU
    cpu uut (
        .clk(clk),
        .inM(inM),
        .instruction(instruction),
        .reset(reset),
        .outM(outM),
        .writeM(writeM),
        .addressM(addressM),
        .pc(pc)
    );

    // Como os sinais irão variar durante a simulação
    initial begin
        $display("Testando CPU");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_cpu);

        // Inicializando os sinais
        clk = 0;
        reset = 0;
        inM = 0;
        instruction = 0;

        // Resetando a CPU
        reset = 1;
        #1;
        reset = 0;

        // Teste 1: Carregar @300 no registrador A (A = 300)
        instruction = 16'b0000000100101100;  // @300
        #2;

        // Teste 2: Executar D=A (D = 300)
        instruction = 16'b1110110000010000;  // D=A
        #2;

        // Teste 3: Carregar @2000 no registrador A (A = 2000)
        instruction = 16'b0000011111010000;  // @2000
        #2;

        // Teste 4: Executar M=D (M = D)
        instruction = 16'b1110001100001000;  // M=D
        #2;

        // Teste 5: Carregar @2500 no registrador A (A = 2500)
        instruction = 16'b0000100111000100;  // @2500
        #2;

        // Teste 6: Executar D=M+1 (D = M + 1)
        inM = 16'b0000000001111100;  // Define inM como 124 (exemplo de valor na memória)
        instruction = 16'b1111110111010000;  // D=M+1
        #2;

        // Teste 7: Carregar @1024 no registrador A (A = 1024)
        instruction = 16'b0000010000000000;  // @1024
        #2;

        // Teste 8: Executar A=M (A = M)
        inM = 16'b0000000000101010;  // Define inM como 42
        instruction = 16'b1111110000100000;  // A=M
        #2;

        // Teste 9: Carregar @500 no registrador A (A = 500)
        instruction = 16'b0000000111110100;  // @500
        #2;

        // Teste 10: Executar D=D-M (D = D - M)
        instruction = 16'b1110010011010000;  // D=D-M
        #2;

        #10 $finish;
    end

    // Clock
    always
        #1 clk = ~clk;  
endmodule
