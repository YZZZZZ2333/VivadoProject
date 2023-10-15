`timescale 10ns / 100ps

module vga_tb();
reg clk;
reg reset;
wire VGA_HSYNC;
wire VGA_VSYNC;
wire [11:0] VGA_D;

vga_disp u_vga_disp
(
    .clk(clk),
    .reset(reset),
    .VGA_HSYNC(VGA_HSYNC),
    .VGA_VSYNC(VGA_VSYNC),
    .VGA_D(VGA_D)
);

initial 
begin
    clk=1'b0;
    forever #5 clk=~clk;
end 

initial
begin
    reset=1;
    #15 reset=1'b0;
    #4200000 $stop;
end
endmodule