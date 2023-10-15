module instr_rom_svga(
    input  logic clk, rst_n,
    naive_bus.slave  bus
);
localparam  INSTR_CNT = 30'd82;
wire [0:INSTR_CNT-1] [31:0] instr_rom_cell = {
    32'h00006e33,   // 0x00000000
    32'h000062b3,   // 0x00000004
    32'h000302b7,   // 0x00000008
    32'h06806313,   // 0x0000000c
    32'h00628023,   // 0x00000010
    32'h06506313,   // 0x00000014
    32'h00628023,   // 0x00000018
    32'h06c06313,   // 0x0000001c
    32'h00628023,   // 0x00000020
    32'h06c06313,   // 0x00000024
    32'h00628023,   // 0x00000028
    32'h06f06313,   // 0x0000002c
    32'h00628023,   // 0x00000030
    32'h02006313,   // 0x00000034
    32'h00628023,   // 0x00000038
    32'h04806313,   // 0x0000003c
    32'h00628023,   // 0x00000040
    32'h05806313,   // 0x00000044
    32'h00628023,   // 0x00000048
    32'h03106313,   // 0x0000004c
    32'h00628023,   // 0x00000050
    32'h03006313,   // 0x00000054
    32'h00628023,   // 0x00000058
    32'h03006313,   // 0x0000005c
    32'h00628023,   // 0x00000060
    32'h03606313,   // 0x00000064
    32'h00628023,   // 0x00000068
    32'h04106313,   // 0x0000006c
    32'h00628023,   // 0x00000070
    32'h00a06313,   // 0x00000074
    32'h00628023,   // 0x00000078
    32'h000062b3,   // 0x0000007c
    32'h000202b7,   // 0x00000080
    32'h06806313,   // 0x00000084
    32'h00628023,   // 0x00000088
    32'h00128293,   // 0x0000008c
    32'h06506313,   // 0x00000090
    32'h00628023,   // 0x00000094
    32'h00128293,   // 0x00000098
    32'h06c06313,   // 0x0000009c
    32'h00628023,   // 0x000000a0
    32'h00128293,   // 0x000000a4
    32'h06c06313,   // 0x000000a8
    32'h00628023,   // 0x000000ac
    32'h00128293,   // 0x000000b0
    32'h06f06313,   // 0x000000b4
    32'h00628023,   // 0x000000b8
    32'h00128293,   // 0x000000bc
    32'h02006313,   // 0x000000c0
    32'h00628023,   // 0x000000c4
    32'h00128293,   // 0x000000c8
    32'h04806313,   // 0x000000cc
    32'h00628023,   // 0x000000d0
    32'h00128293,   // 0x000000d4
    32'h05806313,   // 0x000000d8
    32'h00628023,   // 0x000000dc
    32'h00128293,   // 0x000000e0
    32'h03106313,   // 0x000000e4
    32'h00628023,   // 0x000000e8
    32'h00128293,   // 0x000000ec
    32'h03006313,   // 0x000000f0
    32'h00628023,   // 0x000000f4
    32'h00128293,   // 0x000000f8
    32'h03006313,   // 0x000000fc
    32'h00628023,   // 0x00000100
    32'h00128293,   // 0x00000104
    32'h03606313,   // 0x00000108
    32'h00628023,   // 0x0000010c
    32'h00128293,   // 0x00000110
    32'h04106313,   // 0x00000114
    32'h00628023,   // 0x00000118
    32'h00128293,   // 0x0000011c
    32'h02106313,   // 0x00000120
    32'h00628023,   // 0x00000124
    32'h000062b3,   // 0x00000128
    32'h000312b7,   // 0x0000012c
    32'h01c28023,   // 0x00000130
    32'h001e0e13,   // 0x00000134
    32'h00c003b7,   // 0x00000138
    32'hfff38393,   // 0x0000013c
    32'hfe039ee3,   // 0x00000140
    32'hec1ff06f    // 0x00000144
};

logic [29:0] cell_rd_addr;

assign bus.rd_gnt = bus.rd_req;
assign bus.wr_gnt = bus.wr_req;
assign cell_rd_addr = bus.rd_addr[31:2];
always @ (posedge clk or negedge rst_n)
    if(~rst_n)
        bus.rd_data <= 0;
    else begin
        if(bus.rd_req)
            bus.rd_data <= (cell_rd_addr>=INSTR_CNT) ? 0 : instr_rom_cell[cell_rd_addr];
        else
            bus.rd_data <= 0;
        end

endmodule

