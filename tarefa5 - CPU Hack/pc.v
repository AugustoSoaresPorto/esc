module pc(
    input [15:0] in,
    input load,
    input rst,
    input inc,
    input clk,
    output reg [15:0] out  
);
    always @ ( posedge clk or posedge rst ) begin
        if(rst == 1) 
            out <= 0;
        else if (load == 1) 
            out <= in;
        else if (inc == 1) 
            out <= out + 1;
        else 
            out <= out;
    end
    

endmodule
