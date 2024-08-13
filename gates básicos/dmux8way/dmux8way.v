// Demultiplexador de 8 entradas comportamental

module dmux8way(output reg a,
            output reg b,
            output reg c,
            output reg d,            
            output reg e,
            output reg f,            
            output reg g,
            output reg h,
            input [2:0] sel,
            input entrada);

    always @(*) begin
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
        g = 0;
        h = 0;

        case (sel)
            3'b000: a = entrada;
            3'b001: b = entrada;
            3'b010: c = entrada;
            3'b011: d = entrada;
            3'b100: e = entrada;
            3'b101: f = entrada;
            3'b110: g = entrada;
            3'b111: h = entrada;
        endcase
    end

endmodule