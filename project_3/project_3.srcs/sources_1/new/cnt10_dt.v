module cnt10_dt(
    input           clk,
    input           rst,
    input           en,
    input           load,
    input [3:0]     d,
    output [7:0]    SEL,
    output reg[7:0] DIG
    );
wire cout;
wire [3:0]seconds;
reg [26:0] cnt;
reg s_clk;
localparam DIV_LEN = 24_999_999;
cnt10 c0(
    .clk                (s_clk ),
    .rst                (rst ),
    .en                 (en  ),
    .load               (load),
    .d                  (d   ),
    .q                  (seconds),
    .cout               (cout)
);

always@(posedge clk or posedge rst)
    if (rst) begin
        s_clk<=0;
        cnt<=0;
    end
    else if (en)
        if (cnt < DIV_LEN)
            cnt <= cnt +1'b1;
        else begin
            cnt<=0;
            s_clk<=~s_clk;
        end
assign SEL=8'b1111_0111;
always @*
    case(seconds)
        4'h0:DIG<=8'b11000000; //0
        4'h1:DIG<=8'b11111001; //1
        4'h2:DIG<=8'b10100100; //2
        4'h3:DIG<=8'b10110000; //3
        4'h4:DIG<=8'b10011001; //4
        4'h5:DIG<=8'b10010010; //5
        4'h6:DIG<=8'b10000010; //6
        4'h7:DIG<=8'b11111000; //7
        4'h8:DIG<=8'b10000000; //8
        4'h9:DIG<=8'b10010000; //9
        4'hA:DIG<=8'b10001000; //A
        4'hB:DIG<=8'b10000011; //B
        4'hC:DIG<=8'b11000110; //C
        4'hD:DIG<=8'b10100001; //D
        4'hE:DIG<=8'b10000110; //E
        4'hF:DIG<=8'b10001110; //F
        default:DIG<=8'b11000000; //0
    endcase
endmodule