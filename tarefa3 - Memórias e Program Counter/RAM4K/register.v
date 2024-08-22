module register(
    input [15:0] in,
    input clk,
    input load,
    output reg [15:0] out
);
    always @(posedge clk) begin   
        if(load == 1) 
            out <= in;
    end

endmodule