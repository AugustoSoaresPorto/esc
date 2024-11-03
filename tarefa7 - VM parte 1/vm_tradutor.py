class TradutorVM:
    def __init__(self, nome):
        self.nome_vm = 'vm\\' + nome + '.vm'
        self.nome_asm = 'asm\\' + nome + '.asm'
        self.arq = open(self.nome_asm, 'w')
        self.label_counter = 0

    def traduzir(self):
        with open(self.nome_vm, 'r') as f:
            for linha in f:
                linha = linha.strip()
                if linha and not linha.startswith('//'):
                    self.traduzir_comando(linha)
        self.arq.close()

    def traduzir_comando(self, comando):
        parts = comando.split()
        cmd_type = parts[0]

        if cmd_type == 'push':
            self.write_push(parts[1], parts[2])
        elif cmd_type == 'pop':
            self.write_pop(parts[1], parts[2])
        elif cmd_type == 'add':
            self.write_add()
        elif cmd_type == 'sub':
            self.write_sub()
        elif cmd_type == 'eq':
            self.write_eq()
        elif cmd_type == 'neg':
            self.write_neg()
        elif cmd_type == 'not':
            self.write_not()
        elif cmd_type == 'lt':
            self.write_lt()
        elif cmd_type == 'gt':
            self.write_gt()
        # Add more comando translations as needed

    def write_push(self, segment, index):
        if segment == 'constant':
            self.arq.write(f'@{index}\nD=A\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')
        elif segment == 'local':
            self.arq.write(f'@{index}\nD=A\n@LCL\nA=D+M\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')
        elif segment == 'argument':
            self.arq.write(f'@{index}\nD=A\n@ARG\nA=D+M\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')
        elif segment == 'this':
            self.arq.write(f'@{index}\nD=A\n@THIS\nA=D+M\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')
        elif segment == 'that':
            self.arq.write(f'@{index}\nD=A\n@THAT\nA=D+M\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')
        elif segment == 'temp':
            self.arq.write(f'@5\nD=A\n@{index}\nA=D+A\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')
        elif segment == 'pointer':
            if index == '0':
                self.arq.write(f'@THIS\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')
            elif index == '1':
                self.arq.write(f'@THAT\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')
        elif segment == 'static':
            self.arq.write(f'@{self.nome_vm}.{index}\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n')

    def write_pop(self, segment, index):
        if segment == 'local':
            self.arq.write(f'@{index}\nD=A\n@LCL\nD=D+M\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n')
        elif segment == 'argument':
            self.arq.write(f'@{index}\nD=A\n@ARG\nD=D+M\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n')
        elif segment == 'this':
            self.arq.write(f'@{index}\nD=A\n@THIS\nD=D+M\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n')
        elif segment == 'that':
            self.arq.write(f'@{index}\nD=A\n@THAT\nD=D+M\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n')
        elif segment == 'temp':
            self.arq.write(f'@5\nD=A\n@{index}\nD=D+A\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n')
        elif segment == 'pointer':
            if index == '0':
                self.arq.write(f'@SP\nM=M-1\nA=M\nD=M\n@THIS\nM=D\n')
            elif index == '1':
                self.arq.write(f'@SP\nM=M-1\nA=M\nD=M\n@THAT\nM=D\n')
        elif segment == 'static':
            self.arq.write(f'@SP\nM=M-1\nA=M\nD=M\n@{self.nome_vm}.{index}\nM=D\n')

    def write_add(self):
        self.arq.write('@SP\nM=M-1\nA=M\nD=M\n@SP\nM=M-1\nA=M\nM=D+M\n@SP\nM=M+1\n')

    def write_sub(self):
        self.arq.write('@SP\nM=M-1\nA=M\nD=M\n@SP\nM=M-1\nA=M\nM=M-D\n@SP\nM=M+1\n')

    def write_eq(self):
        self.arq.write(f'@SP\nM=M-1\nA=M\nD=M\n@SP\nM=M-1\nA=M\nD=M-D\n@EQ_TRUE{self.label_counter}\nD;JEQ\n@SP\nA=M\nM=0\n@EQ_END{self.label_counter}\n0;JMP\n(EQ_TRUE{self.label_counter})\n@SP\nA=M\nM=-1\n(EQ_END{self.label_counter})\n@SP\nM=M+1\n')
        self.label_counter += 1

    def write_neg(self):
        self.arq.write('@SP\nM=M-1\nA=M\nM=-M\n@SP\nM=M+1\n')

    def write_not(self):
        self.arq.write('@SP\nM=M-1\nA=M\nM=!M\n@SP\nM=M+1\n')

    def write_lt(self):
        self.arq.write(f'@SP\nM=M-1\nA=M\nD=M\n@SP\nM=M-1\nA=M\nD=M-D\n@LT_TRUE{self.label_counter}\nD;JLT\n@SP\nA=M\nM=0\n@LT_END{self.label_counter}\n0;JMP\n(LT_TRUE{self.label_counter})\n@SP\nA=M\nM=-1\n(LT_END{self.label_counter})\n@SP\nM=M+1\n')
        self.label_counter += 1

    def write_gt(self):
        self.arq.write(f'@SP\nM=M-1\nA=M\nD=M\n@SP\nM=M-1\nA=M\nD=M-D\n@GT_TRUE{self.label_counter}\nD;JGT\n@SP\nA=M\nM=0\n@GT_END{self.label_counter}\n0;JMP\n(GT_TRUE{self.label_counter})\n@SP\nA=M\nM=-1\n(GT_END{self.label_counter})\n@SP\nM=M+1\n')
        self.label_counter += 1