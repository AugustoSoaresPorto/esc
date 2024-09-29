`include "register.v"
`include "alu.v"
`include "pc.v"
`include "mux16.v"

module cpu(
    input clk,
    input [15:0] inM,
    input [15:0] instruction,
    input reset,
    output [15:0] outM,
    output writeM,
    output [15:0] addressM,
    output [15:0] pc
    );

    wire [15:0] A; 
    wire [15:0] D;
    wire [15:0] outM;            
    wire [15:0] out_muxA;
    wire [15:0] out_muxALU;   
    wire zr_out;
    wire ng_out;                 
    reg jump_flag;

    // Calculando os sinais de controle de salto
    always @(*) begin
        case (instruction[2:0])
            3'b000: jump_flag = 0;
            3'b001: jump_flag = !ng_out && !zr_out; 
            3'b010: jump_flag = zr_out;              
            3'b011: jump_flag = !ng_out;             
            3'b100: jump_flag = ng_out;              
            3'b101: jump_flag = zr_out;              
            3'b110: jump_flag = ng_out || zr_out;    
            3'b111: jump_flag = 1;                   
            default: jump_flag = 0;                  
        endcase
    end

    // Sinais de saída
    assign addressM = A;
    assign writeM = instruction[15] & instruction[3];

    // Instanciando os módulos
    alu ALU(.x(D), .y(out_muxALU), .zx(instruction[11]), .nx(instruction[10]), .zy(instruction[9]), .ny(instruction[8]), .f(instruction[7]), .no(instruction[6]), .o(outM), .zr(zr_out), .ng(ng_out));

    mux16 muxA(.a(instruction[15:0]), .b(outM), .sel(instruction[15]), .y(out_muxA));
    mux16 muxALU(.a(A), .b(inM), .sel(instruction[12]), .y(out_muxALU));
    
    pc PC(.in(A), .load(jump_flag), .inc(!jump_flag), .rst(reset), .out(pc), .clk(clk));

    register registerA(.in(out_muxA), .clk(clk), .load(instruction[5]), .out(A));
    register registerD(.in(outM), .clk(clk), .load(instruction[4]), .out(D));
endmodule


