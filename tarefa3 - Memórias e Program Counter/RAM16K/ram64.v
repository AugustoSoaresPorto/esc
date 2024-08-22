`include "ram8.v"

// criando ram de 64 registradores de 16 bits
module ram64 (
    input [15:0] in,
    input [5:0] address,
    input clk, 
    input load,      
    output reg [15:0] out
);
    wire [15:0] out_ram8 [7:0];  
    wire [2:0] ram8_select = address[5:3];
    wire [2:0] ram8_address = address[2:0];

    ram8 ram0 (.in(in), .address(ram8_address), .clk(clk), .load(load & (ram8_select == 3'b000)), .out(out_ram8[0]));
    ram8 ram1 (.in(in), .address(ram8_address), .clk(clk), .load(load & (ram8_select == 3'b001)), .out(out_ram8[1]));
    ram8 ram2 (.in(in), .address(ram8_address), .clk(clk), .load(load & (ram8_select == 3'b010)), .out(out_ram8[2]));
    ram8 ram3 (.in(in), .address(ram8_address), .clk(clk), .load(load & (ram8_select == 3'b011)), .out(out_ram8[3]));
    ram8 ram4 (.in(in), .address(ram8_address), .clk(clk), .load(load & (ram8_select == 3'b100)), .out(out_ram8[4]));
    ram8 ram5 (.in(in), .address(ram8_address), .clk(clk), .load(load & (ram8_select == 3'b101)), .out(out_ram8[5]));
    ram8 ram6 (.in(in), .address(ram8_address), .clk(clk), .load(load & (ram8_select == 3'b110)), .out(out_ram8[6]));
    ram8 ram7 (.in(in), .address(ram8_address), .clk(clk), .load(load & (ram8_select == 3'b111)), .out(out_ram8[7]));

    always @(posedge clk) begin
        out <= out_ram8[ram8_select];
    end

endmodule

