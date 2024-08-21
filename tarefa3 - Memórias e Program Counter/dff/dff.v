module dff(
    input d,
    input clk,
    output reg q,
    output nq     
);
    always @ ( posedge clk or posedge rst ) begin
        if(rst == 1) 
            q <= 0;
        else 
            q <= d;
    end
    
    assign nq = ~q;

endmodule
