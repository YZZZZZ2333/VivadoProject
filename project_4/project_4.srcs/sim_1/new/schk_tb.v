`timescale 10ns / 100ps
module schk_tb();
reg CLK;
reg DIN;
reg RST;
wire SOUT;

schk s_tb(
    .CLK (CLK),
    .DIN (DIN),
    .RST (RST),
    .SOUT (SOUT)
);

initial
begin
    #0
        CLK=0;RST=0;DIN=0;
    #1
        RST=1;
    #2
        RST=0;
    #2
        DIN=1;
    #2
        DIN=0;
    #4 
        DIN=1;
    #12
        DIN=0;
    #4
        DIN=1;
    #4
        DIN=0;
    #2
        DIN=1;
    #12
        DIN=0;
    #4
        DIN=1;
    #4
        DIN=0;
    #10000
        $stop;
end
always #2 CLK=~CLK;
endmodule