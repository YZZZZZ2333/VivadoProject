//=======================================================
//  This code is generated by HX1006A Project Builder
//=======================================================

module HX1006A_USTCRVSoC_top(

////////////CLOCK//////////
input 		          		CLK_50,

////////////SEG8//////////
output 		   [7:0]       	SEL,
output 		   [7:0]     	DIG,

////////////LED//////////
output		     [3:0]		LED,

////////////SW//////////
input 		     [3:0]		SW,

////////////KEY//////////
input 		     [3:0]		KEY,

////////////VGA//////////
output		     [3:0]		VGA_B,
output		     [3:0]		VGA_G,
output		          		VGA_HS,
output		     [3:0]		VGA_R,
output		          		VGA_VS,

////////////Serial Port//////////
output 		          		UART_TXD,
input 		          		UART_RXD 

);


//=======================================================
//  REG/WIRE declarations
wire clk;
//=======================================================
wire vga_red, vga_green, vga_blue;
assign VGA_R = {4{vga_red}};
assign VGA_G = {4{vga_green}};
assign VGA_B = {4{vga_blue}};

wire [31:0] led;
assign {DIG,SEL,LED} = led;

apll	apll_inst (
	.inclk0 ( CLK_50 ),
	.c0 ( clk )
	);


soc_svga_top soc_inst(
    .clk              ( clk      ),
    .isp_uart_rx      ( UART_RXD  ),
    .isp_uart_tx      (  UART_TXD    ),
    .led      			 (  led    ),
    .vga_hsync        ( VGA_HS    ),
    .vga_vsync        ( VGA_VS    ),
    .vga_red          ( vga_red       ),
    .vga_green        ( vga_green     ),
    .vga_blue         ( vga_blue      )
);




//=======================================================
//  Structural coding
//=======================================================



endmodule