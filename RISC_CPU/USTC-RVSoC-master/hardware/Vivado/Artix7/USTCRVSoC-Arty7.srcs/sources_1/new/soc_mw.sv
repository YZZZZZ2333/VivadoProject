module soc_mw(
              input  clk, 
              input  rst_n,
              input  [31:0] i_boot_addr,
              output i_rd_req, 
              output i_rd_be, 
              output i_rd_addr,
              input  i_rd_data, 
              input  i_rd_gnt,
              output i_wr_req, 
              output i_wr_be, 
              output i_wr_addr, 
              output i_wr_data,
              input  i_wr_gnt,
              input  d_boot_addr, 
              output d_rd_req,    
              output d_rd_be,     
              output d_rd_addr,   
              input  d_rd_data,   
              input  d_rd_gnt,    
              output d_wr_req,    
              output d_wr_be,     
              output d_wr_addr,   
              output d_wr_data,   
              input  d_wr_gnt     
);

naive_bus  bus_masters[2]();

core_top c0(
    .clk                        (clk), 
    .rst_n                      (rst_n),
    .i_boot_addr                (i_boot_addr),
    .instr_master               (bus_masters[0]), 
    .data_master                (bus_masters[1])
);

assign i_rd_req   = bus_masters[0].rd_req   ;
assign i_rd_be    = bus_masters[0].rd_be    ;
assign i_rd_addr  = bus_masters[0].rd_addr  ;
assign i_rd_data  = bus_masters[0].rd_data  ;
assign i_rd_gnt   = bus_masters[0].rd_gnt   ;
assign i_wr_req   = bus_masters[0].wr_req   ;
assign i_wr_be    = bus_masters[0].wr_be    ;
assign i_wr_addr  = bus_masters[0].wr_addr  ;
assign i_wr_data  = bus_masters[0].wr_data  ;
assign i_wr_gnt   = bus_masters[0].wr_gnt   ; 


assign d_rd_req   = bus_masters[1].rd_req   ;
assign d_rd_be    = bus_masters[1].rd_be    ;
assign d_rd_addr  = bus_masters[1].rd_addr  ;
assign d_rd_data  = bus_masters[1].rd_data  ;
assign d_rd_gnt   = bus_masters[1].rd_gnt   ;
assign d_wr_req   = bus_masters[1].wr_req   ;
assign d_wr_be    = bus_masters[1].wr_be    ;
assign d_wr_addr  = bus_masters[1].wr_addr  ;
assign d_wr_data  = bus_masters[1].wr_data  ;
assign d_wr_gnt   = bus_masters[1].wr_gnt   ; 

endmodule
