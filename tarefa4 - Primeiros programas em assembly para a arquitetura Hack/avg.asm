// R0 = avg(R1,R2)  Crie um código capaz de calcular a média entre um total de R2 valores armazenados a partir da posição apontada por R1, deixando o resultado em R0. Por exemplo, Se R1 contiver o valor 100 e R2 o valor 10, os valores da memória RAM armazenados entre os endereços 100 a 109 devem ser somados e o resultado divido por 10. Reuse código feito anteriormente.

@RT1
M=0

@2
D=M

@RT2
M=D-1

@1
D=M

@RT3
M=D

@RT2
D=M

@RT3
M=D+M

(LOOP)
@RT3
A=M
D=M

@RT1
M=D+M

@RT3
M=M-1

@RT2
M=M-1
D=M

@LOOP
D;JGE

@0
M=0

(DIVISAO)
@2 
D=M

@RT1 
M=M-D

@0
M=M+1

@RT1
D=M

@DIVISAO
D;JGT

@SAIDA
D;JEQ

@2
D=M

@RT1
M=D+M

@0
M=M-1

(SAIDA)
@RT1
D=M

@RT2
M=D

@END
0;JMP
(END)
