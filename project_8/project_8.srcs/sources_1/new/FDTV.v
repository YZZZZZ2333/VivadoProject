module FDTV (CLK,PM,PM2);
    input CLK; output PM,PM2; reg[8:0] Q1,Q2; reg FULL,FULL2; wire RST,RST2;
    always @(posedge CLK or posedge RST) begin
        if (RST) begin Q1<=0; FULL<=1; end
        else begin Q1<=Q1+1; FULL<=0; end end
    assign RST=(Q1==1249999); assign PM=FULL;
    
    always @(posedge CLK or posedge RST2) begin
        if (RST2) begin Q2<=0; FULL2<=1; end
        Q2<=Q2+1;
        if (Q2==24) FULL2<=0;
    end
    assign PM2=FULL2;
    assign RST2=(Q2==49);
endmodule