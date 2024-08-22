`include "ram512.v"

// criando ram de 4096 registradores de 16 bits
module ram4k (
    input [15:0] in,
    input [11:0] address,
    input clk, 
    input load,      
    output reg [15:0] out
);
    wire [15:0] out_ram512 [7:0];  
    wire [2:0] ram512_select = address[11:9];
    wire [8:0] ram512_address = address[8:0];

    // Conectando os módulos ram512 corretamente com os bits de endereço apropriados
    ram512 ram0 (.in(in), .address(ram512_address), .clk(clk), .load(load & (ram512_select == 3'b000)), .out(out_ram512[0]));
    ram512 ram1 (.in(in), .address(ram512_address), .clk(clk), .load(load & (ram512_select == 3'b001)), .out(out_ram512[1]));
    ram512 ram2 (.in(in), .address(ram512_address), .clk(clk), .load(load & (ram512_select == 3'b010)), .out(out_ram512[2]));
    ram512 ram3 (.in(in), .address(ram512_address), .clk(clk), .load(load & (ram512_select == 3'b011)), .out(out_ram512[3]));
    ram512 ram4 (.in(in), .address(ram512_address), .clk(clk), .load(load & (ram512_select == 3'b100)), .out(out_ram512[4]));
    ram512 ram5 (.in(in), .address(ram512_address), .clk(clk), .load(load & (ram512_select == 3'b101)), .out(out_ram512[5]));
    ram512 ram6 (.in(in), .address(ram512_address), .clk(clk), .load(load & (ram512_select == 3'b110)), .out(out_ram512[6]));
    ram512 ram7 (.in(in), .address(ram512_address), .clk(clk), .load(load & (ram512_select == 3'b111)), .out(out_ram512[7]));

    always @(posedge clk) begin
        out <= out_ram512[ram512_select];
    end

endmodule
