// Multiplexador de 8 entradas comportamental, de 16 bits
//
module mux8way16(
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,            
    input [15:0] e,
    input [15:0] f,            
    input [15:0] g,
    input [15:0] h,
    input [2:0] sel,
    output reg [15:0] y
    );

    always @(*) begin
        case (sel)
            3'b000: y = a;
            3'b001: y = b;
            3'b010: y = c;
            3'b011: y = d;
            3'b100: y = e;
            3'b101: y = f;
            3'b110: y = g;
            3'b111: y = h;
        endcase
    end

endmodule