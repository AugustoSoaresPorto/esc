module alu(
    input [15:0] x, 
    input [15:0] y,     
    input zx, 
    input nx, 
    input zy, 
    input ny, 
    input [5:0] f, 
    input no,
    output reg [15:0] o,      
    output zr, 
    output ng    
    );
    
    wire [5:0] sel;
    assign sel[5] = zx;
    assign sel[4] = nx;
    assign sel[3] = zy;
    assign sel[2] = ny;
    assign sel[1] = f;
    assign sel[0] = no;

    always @(*) begin
        case (sel)
            6'b101010: o = 0;
            6'b111111: o = 1;
            6'b111010: o = -1;
            6'b001100: o = x;
            6'b110000: o = y;
            6'b001101: o = ~x;
            6'b110001: o = ~y;
            6'b001111: o = -x;
            6'b110011: o = -y;
            6'b011111: o = x + 1;
            6'b110111: o = y + 1;
            6'b000010: o = x + y;
            6'b010011: o = x - y;
            6'b000111: o = y - x;
            6'b000000: o = x & y;
            6'b010101: o = x | y;
        endcase
    end

    assign zr = (o == 0) ? 1 : 0;
    assign ng = o[15];
endmodule
