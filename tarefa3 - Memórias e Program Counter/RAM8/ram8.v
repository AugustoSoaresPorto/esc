//criando ram de 8 registradores de 16 bits
`include "register.v"

module ram8(
    input [15:0] in,
    input load,
    input clk,
    input [2:0] address,
    output reg [15:0] out
);

    case(address)
        3'b000: register r0(in, clk, load, out);
        3'b001: register r1(in, clk, load, out);
        3'b010: register r2(in, clk, load, out);
        3'b011: register r3(in, clk, load, out);
        3'b100: register r4(in, clk, load, out);
        3'b101: register r5(in, clk, load, out);
        3'b110: register r6(in, clk, load, out);
        3'b111: register r7(in, clk, load, out);
    endcase

endmodule
