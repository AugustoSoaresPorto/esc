module bit(
    input in,
    input clk,
    input load,
    output reg out
);
    always @(posedge clk) begin   
        if(load) 
            out <= in;
        else
            out <= out;
    end

endmodule
