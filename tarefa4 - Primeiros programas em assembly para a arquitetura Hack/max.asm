// R0 = max(R1,R2,R3)  Crie um código capaz de computar o valor máximo entre 3 valores fornecidos. Os valores devem ser armazenados em R1, R2 e R3 e o resultado deve estar em R0 ao final do processamento. 

    @1
    D=M              // D = R1 
    @2
    D=D-M            // D = R1 - R2

    @UM_MAIOR_QUE_DOIS
    D;JGT            // se D>0 (R1 é maior) goto UM_MAIOR_QUE_DOIS

    @2
    D=M              // D = R2
    @DOIS_MAIOR_QUE_UM
    0;JMP            // goto DOIS_MAIOR_QUE_UM

(UM_MAIOR_QUE_DOIS)
    @1             
    D=M              // D = R1
    @3
    D=D-M            // D = R1 - R3

    @SAIDA_UM
    D;JGT            // se D>0 (R1 é maior) goto SAIDA_UM

    @3
    D=M              // D = R3
    @0
    M=D              // R0 = R3

    @FIM             // salto para o fim
    0;JMP            // goto FIM

(DOIS_MAIOR_QUE_UM)
    @2             
    D=M              // D = R2
    @3
    D=D-M            // D = R2 - R3

    @SAIDA_DOIS
    D;JGT            // se D>0 (R2 é maior) goto SAIDA_DOIS

    @3
    D=M              // D = R3
    @0
    M=D              // R0 = R3

    @FIM             // salto para o fim
    0;JMP            // goto FIM

(SAIDA_UM)
    @1
    D=M              // D = R1
    @0
    M=D              // R0 = R1

    @FIM             // salto para o fim
    0;JMP            // goto FIM

(SAIDA_DOIS)
    @2
    D=M              // D = R2
    @0
    M=D              // R0 = R2

    @FIM             // salto para o fim
    0;JMP            // goto FIM

(FIM)
    @FIM
    0;JMP            // fim do programa