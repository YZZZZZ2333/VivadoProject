module SPKER (CLK,RST,TN,SPKS);
    input CLK,RST; input [10:0] TN; output SPKS;
    reg SPKS; reg[10:0] CNT11;
    always @(posedge CLK or negedge RST) 
        begin //: CNT11B_LOAD
        if (!RST) CNT11<=TN;
        else
            if (CNT11==11'h7FF) 
            begin 
                CNT11=TN; 
                SPKS<=1'b1; 
            end
            else 
            begin 
                CNT11=CNT11+1; 
                SPKS<=1'b0; 
            end
     end
endmodule