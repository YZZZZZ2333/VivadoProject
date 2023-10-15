`timescale 10ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/15 16:50:30
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb();
reg [2:0] aluop;
reg [31:0] alua, alub;
wire [31:0] alur;
alu a0(.aluop(aluop),.alua(alua),.alub(alub),.alur(alur));

initial
begin
aluop<=0;
repeat(8)
    begin
        alua<={$random}%32'HFFFF_FFFF;
        alub<={$random}%32'HFFFF_FFFF;
        #10 aluop <= aluop+1;
    end
$stop;
end
endmodule
