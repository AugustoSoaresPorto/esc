module bit(
    input in,
    input load,
    output reg out
);
    always @(in) begin   
    if(load) 
        #1 out <= in;
    else
        #1 out <= out;
    end

endmodule
