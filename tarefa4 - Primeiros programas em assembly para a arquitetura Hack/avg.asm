// R0 = avg(R1,R2)  Crie um código capaz de calcular a média entre um total de R2 valores armazenados a partir da posição apontada por R1, deixando o resultado em R0. Por exemplo, Se R1 contiver o valor 100 e R2 o valor 10, os valores da memória RAM armazenados entre os endereços 100 a 109 devem ser somados e o resultado divido por 10. Reuse código feito anteriormente.

@I
M=0            // RI = 0
@0
M=0            // R0 = 0
@SOMA
0;JMP

(SOMA)
    @I
    D=M
    @2
    D=D-M

    @AJUSTE
    D;JEQ

    @I
    D=M
    @1
    D=M+D            // D = R1 + RI
    @D
    D=M              // D = M[R1 + RI]
    @0
    M=M+D            // R0 = R0 + M[R1 + RI]

    @I
    M=M+1

    @SOMA
    0;JMP            // goto SOMA

(AJUSTE)
    @0
    D=M              // D = R0
    @1
    M=D              // R1 = R0
    @0
    M=0              // R0 = 0

    @DIVISAO
    0;JMP            // goto DIVISAO

(DIVISAO)
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

    @DIVISAO
    0;JMP            // goto DIVISAO

(FIM)
    @FIM
    0;JMP            // goto FIM