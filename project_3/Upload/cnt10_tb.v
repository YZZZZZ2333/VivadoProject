`timescale 10ns / 100ps
module cnt10_tb();
reg clk;
reg rst;
reg en;
reg load;
reg [3:0] d;
wire [3:0] q;
wire cout;

cnt10 c0(
        .clk            (clk),
        .rst            (rst),
        .en             (en),
        .load           (load),
        .d              (d),
        .q              (q),
        .cout           (cout)
        );
        
 initial
 begin
 
 #0 rst = 1;
    clk = 0;           
    en = 0;
    load = 0;
    d = 5;
 #10    rst =0;        
        en  =1;        
        load =1;
 #10    load =0;
 #10000 $stop;
 end
 
 always #5 clk= ~clk;
 
 endmodule
