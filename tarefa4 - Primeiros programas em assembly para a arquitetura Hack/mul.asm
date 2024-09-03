// R0 = mul(R1,R2)  Crie um código capaz de multiplicar dois números armazenados em R1 e R2  (no fundo, calcular R1*R2), deixando o resultado em R0. Como a ALU não faz multiplicações, trabalhe com a ideia de fazer múltiplas adições na sua solução.

(LOOP)
    @1
    D=M                // D = R1
    @0
    M=M+D                // R0 = R1

    @2
    D=M-1              // D = R2
    M=D                // R2 = R2 - 1

    @FIM
    D;JEQ              // se D=0 goto FIM

    @LOOP
    0;JMP            // goto LOOP

(FIM)
    @FIM
    0;JMP            // goto FIM