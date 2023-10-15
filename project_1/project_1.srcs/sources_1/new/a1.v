`timescale 1ns / 1ps

module a1
(   input [1:0] a,
    output reg[3:0] y
); 
always @(a)
    case(a)
        0 : y = 4'b0001;
        1 : y = 4'b0010;
        2 : y = 4'b0100;
        3 : y = 4'b1000;
        default : y = 4'b0001;
    endcase
endmodule  
