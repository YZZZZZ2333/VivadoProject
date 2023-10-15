module vga_disp
(
	input	clk,
	input	reset,
	
	output	VGA_HSYNC,
	output	VGA_VSYNC,
	
	output	reg[11:0] VGA_D
);

reg[9:0]	hcnt;
reg[9:0]	vcnt;
reg			hs;
reg 		vs;
reg 		clk25M;
reg         clk50M;

wire[2:0]	rgb;
wire[9:0]	x;
wire[9:0]	y;
wire		dis_en;

assign x = hcnt;
assign y = vcnt;
assign VGA_VSYNC = vs;
assign VGA_HSYNC = hs;
assign dis_en = {x<10'd640 && y<10'd480};
assign rgb = x[8:6];


always @(posedge clk or posedge reset) begin
	if(reset)
		clk50M <= 1'b0;
	else
		clk50M <= ~clk50M;
end

always @(posedge clk50M or posedge reset) begin
    if(reset)
        clk25M <= 1'b0;
    else 
        clk25M <= ~clk25M;
end

always@(posedge	clk25M or posedge reset) begin
	if(reset)
		hcnt <= 1'b0;
	else begin
		if(hcnt < 800)
			hcnt <= hcnt+1'b1;
		else
			hcnt <= 1'b0;
	end
end

always @(posedge clk25M or posedge reset)begin
	if(reset)
		vcnt <= 1'b0;
	else begin
		if(hcnt == 10'd640 + 10'd8)begin
			if(vcnt < 10'd525)
				vcnt <= vcnt + 1'b1;
			else
				vcnt <= 1'b0;
		end
	end
end

always @(posedge clk25M or posedge reset)begin
	if(reset)
		hs <= 1'b1;
	else begin
		if((hcnt >= 640+8+8) & (hcnt < 640+8+8+96))
			hs <=1'b0;
		else 
			hs <= 1'b1;
	end
end

always @(vcnt or reset) begin
	if(reset)
		vs <= 1'b1;
	else begin
		if((vcnt >= 480+8+2) && (vcnt < 480+8+2+2))
			vs <= 1'b0;
		else 
			vs <= 1'b1;
	end
end

always @(posedge clk25M or posedge reset)begin
	if(reset)
		VGA_D <= 1'b0;
	else begin
		if(hcnt < 10'd640 & vcnt < 10'd480 && dis_en) begin
			VGA_D[11:8] <= rgb[0]?4'hf:0;
			VGA_D[ 7:4] <= rgb[1]?4'hf:0;
			VGA_D[ 3:0] <= rgb[2]?4'hf:0;
		end
		else begin
			VGA_D <= 1'b0;
		end
	end
end

endmodule
