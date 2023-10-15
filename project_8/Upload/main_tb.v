`timescale 10ns / 100ps
module main_tb();
    reg CLK,RST;
    wire [3:0] LED;
    wire SPK;
    wire H;
    //wire PM1;
    //wire [7:0] CNT;
    
    main m(
        .RST0(RST),
        .CLK0(CLK),
        .LED(LED),
        .SPK_KX(SPK),
        .H(H)
        //.PM1(PM1),
        //.CNT(CNT)
    );
    
    initial
    begin
        #0 CLK=0; RST=0;
        #2 RST=1;
    end
    always #2 CLK=~CLK;
endmodule
