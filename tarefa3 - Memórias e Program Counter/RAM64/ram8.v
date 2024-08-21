`include "register.v"

// criando ram de 8 registradores de 16 bits
module ram8 (
    input [15:0] in,
    input [2:0] address,
    input clk, 
    input load,      
    output reg [15:0] out
);
    wire [15:0] out_regs [7:0];  

    register r0(.in(in), .clk(clk), .load(load & (address == 3'b000)), .out(out_regs[0]));
    register r1(.in(in), .clk(clk), .load(load & (address == 3'b001)), .out(out_regs[1]));
    register r2(.in(in), .clk(clk), .load(load & (address == 3'b010)), .out(out_regs[2]));
    register r3(.in(in), .clk(clk), .load(load & (address == 3'b011)), .out(out_regs[3]));
    register r4(.in(in), .clk(clk), .load(load & (address == 3'b100)), .out(out_regs[4]));
    register r5(.in(in), .clk(clk), .load(load & (address == 3'b101)), .out(out_regs[5]));
    register r6(.in(in), .clk(clk), .load(load & (address == 3'b110)), .out(out_regs[6]));
    register r7(.in(in), .clk(clk), .load(load & (address == 3'b111)), .out(out_regs[7]));

    always @(posedge clk) begin
        out <= out_regs[address];
    end

endmodule

