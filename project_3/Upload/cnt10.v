module cnt10(
    input clk,
    input rst,
    input en,
    input load,
    input [3:0] d,
    output reg[3:0] q,
    output cout
    );
assign cout = (q == 4'd9) ? 1'b1 : 1'b0;
always@(posedge clk or posedge rst)
    if (rst)
        q<=4'd0;
    else if(en)
        if (load)
            q<=d;
        else if (q<4'd9)
            q<=q+1'b1;
        else
            q<=4'd0;
endmodule 