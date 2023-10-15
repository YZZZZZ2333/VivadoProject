module main(CLK0,RST0,LED,SPK_KX,H/*,PM1,CNT*/);
    input CLK0,RST0;
    output SPK_KX;
    output [3:0] LED;
    output H;
    //output PM1;
    //output [7:0] CNT;
    reg [7:0] CNT8;
    wire [3:0] Q;
    reg CLK,CLK1M;
    wire [10:0] T;
    reg [29:0] Q1,Q2; 
    wire SPK;
    reg SPK_KX;

    always @(posedge CLK0 or negedge RST0) 
    begin
        if (!RST0) 
        begin 
            Q1<=0; CLK<=1'b0; 
        end
        else 
        begin
            if (Q1==0) CLK<=1'b0;
            Q1<=Q1+1;
            if (Q1==12499999)
            begin 
                Q1<=0; 
                CLK<=1'b1; 
            end
        end
    end
    //assign PM1=CLK;
    
    always @(posedge CLK0 or negedge RST0) begin
        if (!RST0)
        begin 
            Q2<=0; 
            CLK1M<=1'b0; 
        end
        else
        begin
            Q2<=Q2+1;
            if (Q2==24) 
            begin
                CLK1M=~CLK1M;
                Q2<=0;
            end
        end
    end
    
    wire LD; 
    always @(posedge CLK or negedge RST0) 
    begin
        if (!RST0) CNT8<=8'b00000000; 
        else
        begin 
            CNT8<=CNT8+1; 
            if (CNT8==26)
                CNT8<=8'b00000000;
            end
    end
    //assign CNT=CNT8;
    
    dist_mem_gen_0 d0(
        .a(CNT8),
        .clk(CLK),
        .spo(Q)
    );
    
    F_CODE FC(
        .INX(Q),
        .CODE(LED),
        .TO(T),
        .H(H)
    );
   
    SPKER SP(
        .CLK(CLK1M),
        .RST(RST0),
        .TN(T),
        .SPKS(SPK)
    );
    
    always @(posedge SPK or negedge RST0)
    begin
        if (!RST0) SPK_KX<=0;
        else
            SPK_KX<=~SPK_KX;
    end
        
endmodule
