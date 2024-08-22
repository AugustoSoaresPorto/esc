`include "ram4k.v"

// criando ram de 16384 registradores de 16 bits
module ram16k (
    input [15:0] in,
    input [13:0] address,
    input clk, 
    input load,      
    output reg [15:0] out
);
    wire [15:0] out_ram4k [7:0];  
    wire [2:0] ram4k_select = address[13:12];
    wire [11:0] ram4k_address = address[11:0];

    // Conectando os módulos ram4k corretamente com os bits de endereço apropriados
    ram4k ram0 (.in(in), .address(ram4k_address), .clk(clk), .load(load & (ram4k_select == 2'b00)), .out(out_ram4k[0]));
    ram4k ram1 (.in(in), .address(ram4k_address), .clk(clk), .load(load & (ram4k_select == 2'b01)), .out(out_ram4k[1]));
    ram4k ram2 (.in(in), .address(ram4k_address), .clk(clk), .load(load & (ram4k_select == 2'b10)), .out(out_ram4k[2]));
    ram4k ram3 (.in(in), .address(ram4k_address), .clk(clk), .load(load & (ram4k_select == 2'b11)), .out(out_ram4k[3]));

    always @(posedge clk) begin
        out <= out_ram4k[ram4k_select];
    end

endmodule
