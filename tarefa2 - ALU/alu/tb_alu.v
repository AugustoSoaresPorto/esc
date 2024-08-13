`include "alu.v"

module tb_alu;

    reg [15:0] in_x; 
    reg [15:0] in_y;     
    reg in_zx; 
    reg in_nx; 
    reg in_zy; 
    reg in_ny; 
    reg in_f; 
    reg in_no;
    wire [15:0] out_o;      
    wire out_zr; 
    wire out_ng; 
    
    alu uut (
        .x(in_x), 
        .y(in_y), 
        .zx(in_zx), 
        .nx(in_nx), 
        .zy(in_zy), 
        .ny(in_ny),
        .f(in_f), 
        .no(in_no), 
        .o(out_o), 
        .zr(out_zr), 
        .ng(out_ng)
    );

    initial begin
        $display("Testbench para o ALU");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_alu);

        # 0 in_x = $random; in_y = $random; in_zx = 1; in_nx = 0; in_zy = 1; in_ny = 0; in_f = 1; in_no = 0;
        # 10 in_x = $random; in_y = $random; in_zx = 1; in_nx = 1; in_zy = 1; in_ny = 1; in_f = 1; in_no = 1;
        # 10 in_x = $random; in_y = $random; in_zx = 1; in_nx = 1; in_zy = 1; in_ny = 0; in_f = 1; in_no = 0;
        # 10 in_x = $random; in_y = $random; in_zx = 0; in_nx = 0; in_zy = 1; in_ny = 1; in_f = 0; in_no = 0;
        # 10 in_x = $random; in_y = $random; in_zx = 1; in_nx = 1; in_zy = 0; in_ny = 0; in_f = 0; in_no = 0;
        # 10 in_x = 16'hFFFF; in_y = $random; in_zx = 0; in_nx = 0; in_zy = 1; in_ny = 1; in_f = 0; in_no = 1;
        # 10 in_x = $random; in_y = 16'h0000; in_zx = 1; in_nx = 1; in_zy = 0; in_ny = 0; in_f = 0; in_no = 1;
        # 10 in_x = 16'h0001; in_y = $random; in_zx = 0; in_nx = 0; in_zy = 1; in_ny = 1; in_f = 1; in_no = 1;
        # 10 in_x = $random; in_y = 16'hFFFF; in_zx = 1; in_nx = 1; in_zy = 0; in_ny = 0; in_f = 1; in_no = 1;
        # 10 in_x = 16'h0001; in_y = $random; in_zx = 0; in_nx = 1; in_zy = 1; in_ny = 1; in_f = 1; in_no = 1;
        # 10 in_x = $random; in_y = 16'h0010; in_zx = 1; in_nx = 1; in_zy = 0; in_ny = 1; in_f = 1; in_no = 1;
        # 10 in_x = 16'h0001; in_y = 16'h0010; in_zx = 0; in_nx = 0; in_zy = 0; in_ny = 0; in_f = 1; in_no = 0;
        # 10 in_x = 16'h0001; in_y = 16'h0010; in_zx = 0; in_nx = 1; in_zy = 0; in_ny = 0; in_f = 1; in_no = 1;
        # 10 in_x = 16'h0001; in_y = 16'h0010; in_zx = 0; in_nx = 0; in_zy = 0; in_ny = 1; in_f = 1; in_no = 1;
        # 10 in_x = $random; in_y = 16'h0000; in_zx = 0; in_nx = 0; in_zy = 0; in_ny = 0; in_f = 0; in_no = 0;
        # 10 in_x = $random; in_y = 16'h0000; in_zx = 0; in_nx = 1; in_zy = 0; in_ny = 1; in_f = 0; in_no = 1;

        # 10 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tx=%d,y=%d,zx=%d,nx=%d,zy=%d,ny=%d,f=%d,no=%d,s=%d,o=%d,zr=%d,ng=%d \n",$time,
                 in_x,in_y,in_zx,in_nx,in_zy,in_ny,in_f,in_no,out_o,out_zr,out_ng);
    end

endmodule
