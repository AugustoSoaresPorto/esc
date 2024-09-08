// R0 = div(R1,R2)  Crie um código capaz de dividir dois números armazenados em R1 e R2 (no fundo, calcular R1/R2), deixando o resultado em R0. Como a ALU não faz divisões, trabalhe com a ideia de fazer múltiplas subtrações na sua solução.

@0
M=0                // R0 = 0
@LOOP
0;JMP

(LOOP)
    @2
    D=M              // D = R1
    @1
    M=M-D            // R1 = R1 - R2

    @0
    M=M+1            // R0 = R0 + 1

    @1
    D=M
    @2
    D=D-M
    @FIM
    D;JLT            // se D<0 (RESTO R1 < DIVISOR R2) goto FIM

    @LOOP
    0;JMP            // goto LOOP

(FIM)
    @FIM
    0;JMP            // goto FIM