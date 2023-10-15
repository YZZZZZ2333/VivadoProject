`timescale 10ns / 100ps
module pc_tb();
reg clk;
reg rst;
reg [2:0]PC_src_sel;
wire [31:0]PC_PIF;
reg [31:0]PC_DX;
reg [31:0]jal_offset;
reg [31:0]rs1_data;
reg [31:0]jalr_offset;
reg [31:0]imm_b;
reg [31:0]PC_IF;
reg [31:0]handler_PC;
reg [31:0]epc;

pc pctb(clk,rst,PC_src_sel,PC_PIF,PC_DX,jal_offset,rs1_data,jalr_offset,imm_b,PC_IF,handler_PC,epc);
initial 
begin
    clk<=0;
    rst<=0;
    #2 
        rst<=1;
    #3 
        rst<=0;
    repeat(10) 
    begin
        PC_src_sel<=$random;
        PC_DX<=$random;
        jal_offset<=$random;
        rs1_data<=$random;
        jalr_offset<=$random;
        imm_b<=$random;
        PC_IF<=$random;
        handler_PC<=$random;
        epc<=$random;
        #5;
    end
    #10000 
        $stop;
end

always #2
begin
    clk<=~clk;
end
endmodule
