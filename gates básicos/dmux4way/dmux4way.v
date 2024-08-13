// Demultiplexador de 4 entradas comportamental
//
module dmux4way(output reg a, output reg b, output reg c, output reg d, input [1:0] sel, input e);

    always @(*) begin
        a = 0;
        b = 0;
        c = 0;
        d = 0;

        case (sel)
            2'b00: a = e;
            2'b01: b = e;
            2'b10: c = e;
            2'b11: d = e;
        endcase
    end

endmodule