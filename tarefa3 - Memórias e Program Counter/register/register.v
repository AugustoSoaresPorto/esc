module register(
    input [15:0] in,
    input load,
    output reg [15:0] out
);
    always @(in) begin   
    if(load) 
        #1 out <= in;
    else
        #1 out <= out;
    end

endmodule
