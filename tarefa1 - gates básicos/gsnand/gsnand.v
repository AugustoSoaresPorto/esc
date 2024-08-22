// Sincronizando saidas com entradas, blocos always
// Porta nand mudando sempre que a entrada for alterada
// Note os seguintes detalhes:
// output reg y => nao eh mais um wire ! Um registro vai ser sintetizado
// always @ ( a, b ) => agora temos uma lista de sinais
// por y ser reg, nao tem o assign na frente mais

// Dicas: https://www.chipverify.com/verilog/verilog-always-block

module gsnand(input a, input b, output reg y);
  
  // always @ (lista de sinais)
  always @ ( a, b ) begin
    y = ~(a & b);
  end

endmodule

