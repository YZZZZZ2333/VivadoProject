module pc(
    clk,rst,PC_src_sel,PC_PIF,PC_DX,jal_offset,rs1_data,jalr_offset,imm_b,PC_IF,handler_PC,epc
    );
parameter PC_JAL_TARGET=0,PC_JALR_TARGET=1,PC_BRANCH_TARGET=2,PC_REPLAY=3,PC_HANDLER=4,PC_EP=5;
input clk;
input [2:0] PC_src_sel;
input rst;
input [31:0]PC_DX;
input [31:0]jal_offset;
input [31:0]rs1_data;
input [31:0]jalr_offset;
input [31:0]imm_b;
input [31:0]PC_IF;
input [31:0]handler_PC;
input [31:0]epc;
reg [31:0] temp;
output [31:0] PC_PIF;
always @ (posedge clk,posedge rst)begin
if(rst)begin
    temp<=0;
end 
else 
begin
    case(PC_src_sel)
        PC_JAL_TARGET:temp<=PC_DX+jal_offset;
        PC_JALR_TARGET:temp<=rs1_data+jalr_offset;
        PC_BRANCH_TARGET:temp<=PC_DX+imm_b;
        PC_REPLAY:temp<=PC_IF;
        PC_HANDLER:temp<=handler_PC;
        PC_EP:temp<=epc;
        default:temp<=PC_IF+4;
    endcase
end
end
assign PC_PIF=temp;
endmodule