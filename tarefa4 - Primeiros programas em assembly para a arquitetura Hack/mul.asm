// R0 = mul(R1,R2)  Crie um código capaz de multiplicar dois números armazenados em R1 e R2  (no fundo, calcular R1*R2), deixando o resultado em R0. Como a ALU não faz multiplicações, trabalhe com a ideia de fazer múltiplas adições na sua solução.

@0
M=0

@2
D=M
@LOOP
D;JGT

@END
0;JMP

(LOOP)
    @0
    D=M

    @1
    D=D+M

    @0
    M=D

    @2
    D=M-1
    M=D

    @LOOP
    D;JGT

(END)
    @END
    0;JMP
