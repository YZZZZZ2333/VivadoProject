module SPEAKER #(
    parameter SPK_CLK = 1)
(
    input logic CLK0,RST0,
    output logic SPK_KX,
    output logic [3:0] LED,
    output logic H,
    naive_bus.slave  bus
    );
   
    //output PM1;
    //output [7:0] CNT;
    reg [7:0] CNT8;
    logic [7:0] Q;
    reg CLK,CLK1M;
    wire [10:0] T;
    reg [29:0] Q1,Q2; 
    wire SPK;
    reg SPK_KX1;
    assign bus.rd_gnt = bus.rd_req;
    assign bus.wr_gnt = bus.wr_req;
    assign bus.rd_data = Q;
    assign SPK_KX=SPK_KX1;
//    always @(posedge CLK0 or negedge RST0) 
//    begin
//        if (!RST0) 
//        begin 
//            Q1<=0; CLK<=1'b0; 
//        end
//        else 
//        begin
//            if (Q1==0) CLK<=1'b0;
//            Q1<=Q1+1;
//            if (Q1==12499999)
//            begin 
//                Q1<=0; 
//                CLK<=1'b1; 
//            end
//        end
//    end
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
        if (!RST0) SPK_KX1<=0;
        else
            SPK_KX1<=~SPK_KX1;
    end
        
endmodule
