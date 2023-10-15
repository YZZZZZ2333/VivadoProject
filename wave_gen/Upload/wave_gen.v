module wave_gen (
    CLK,
    EN,
    RST,
    Q
);
    input CLK,RST,EN;
    output [7:0] Q;
    wire [6:0] cntcout;
    
    cnt7b c0(
        .clk(CLK),
        .en(EN),
        .q(cntcout),
        .reset(RST)
    );
    
    dist_mem_gen_0 d0(
                      .a(cntcout),
                      .clk(CLK),
                      .spo(Q)
    );
    
    ila_0 i0(
        .clk(CLK),
        .probe0(Q)
    );
    
endmodule