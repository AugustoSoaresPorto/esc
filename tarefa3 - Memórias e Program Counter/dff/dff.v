module dff(
    input d,
    output reg q,
    output nq     
);
    always @(d) begin    
        #1 q <= d;
    end
    
    assign nq = ~q;

endmodule
