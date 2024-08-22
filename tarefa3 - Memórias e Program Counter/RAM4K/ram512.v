`include "ram64.v"

// criando ram de 512 registradores de 16 bits
module ram512 (
    input [15:0] in,
    input [8:0] address,
    input clk, 
    input load,      
    output reg [15:0] out
);
    wire [15:0] out_ram64 [7:0];  
    wire [2:0] ram64_select = address[8:6];
    wire [5:0] ram64_address = address[5:0];

    // Conectando os módulos ram64 corretamente com os bits de endereço apropriados
    ram64 ram0 (.in(in), .address(ram64_address), .clk(clk), .load(load & (ram64_select == 3'b000)), .out(out_ram64[0]));
    ram64 ram1 (.in(in), .address(ram64_address), .clk(clk), .load(load & (ram64_select == 3'b001)), .out(out_ram64[1]));
    ram64 ram2 (.in(in), .address(ram64_address), .clk(clk), .load(load & (ram64_select == 3'b010)), .out(out_ram64[2]));
    ram64 ram3 (.in(in), .address(ram64_address), .clk(clk), .load(load & (ram64_select == 3'b011)), .out(out_ram64[3]));
    ram64 ram4 (.in(in), .address(ram64_address), .clk(clk), .load(load & (ram64_select == 3'b100)), .out(out_ram64[4]));
    ram64 ram5 (.in(in), .address(ram64_address), .clk(clk), .load(load & (ram64_select == 3'b101)), .out(out_ram64[5]));
    ram64 ram6 (.in(in), .address(ram64_address), .clk(clk), .load(load & (ram64_select == 3'b110)), .out(out_ram64[6]));
    ram64 ram7 (.in(in), .address(ram64_address), .clk(clk), .load(load & (ram64_select == 3'b111)), .out(out_ram64[7]));

    always @(posedge clk) begin
        out <= out_ram64[ram64_select];
    end

endmodule
