`timescale 1ns / 1ps
module alu
#(
    parameter ADD=0,SUB=1,AND=2,OR=3,XOR=4,NOT=5,SL=6,SR=7
)
(
    input [2:0] aluop,
    input [31:0] alua,alub,
    output reg[31:0] alur
    );
    
    
always @*
    case(aluop)
        ADD : alur = alua + alub;
        SUB : alur = alua - alub;
        AND : alur = alua & alub;
        OR : alur = alua | alub;
        XOR : alur = alua ^ alub;
        NOT : alur = ~alua;
        SL : alur = alua << 1;
        SR : alur = alua >> 1;
        default : alur = alua + alub;
     endcase
endmodule