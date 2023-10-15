module vga_disp(
         input clk,
         input reset,
         output VGA_HSYNC,
         output VGA_VSYNC,
         output reg[11:0] VGA_D
    );
    reg [9:0] hcnt;
    reg [9:0] vcnt;
    reg hs;
    reg vs;
    reg clk25M;
    
    reg [2:0] rgb;
    wire [9:0] x;
    wire [9:0] y;
    wire dis_en;
    
    assign x=hcnt;
    assign y=vcnt;
    assign VGA_VSYNC=vs;
    assign VGA_HSYNC=hs;
    assign dis_en=(x<10'd640 && y<10'd480);
    
    always @(posedge clk or negedge reset) begin
       if(!reset) begin
          clk25M<=1'b0;
          end
        else
           clk25M<=~clk25M;
        end
     
     always @(posedge clk25M or negedge reset) begin
     if(!reset)
         hcnt<=1'b0;
         else begin
           if(hcnt<800)
              hcnt<=hcnt+1'b1;
              else
                hcnt <=1'b0;
                end
          end
         
         always @ (posedge clk25M or negedge reset)begin
         if(!reset)
            rgb<=0;
            else 
            case(hcnt[8:6]) 
            0:rgb<=1;
            1:rgb<=8;
            2:rgb<=0;
            3:rgb<=5;
            4:rgb<=2;
            5:rgb<=0;
            6:rgb<=3;
            7:rgb<=2;
            default: rgb<=0;
           endcase
        end
          
       always @(posedge clk25M or negedge reset) begin
        if(!reset)
        vcnt<=1'b0;
        else begin
           if(hcnt==10'd640 +10'd8)begin
              if(vcnt<10'd525)
                vcnt<=vcnt+1'b1;
              else
                 vcnt<=1'b0;
                 end
              end
         end
         
    always @(posedge clk25M or negedge reset) begin
       if(!reset)
          hs<=1'b1;
        else begin 
        if((hcnt>=640+8+8) & (hcnt<640+8+8+96))
           hs<=1'b0;
          else
            hs<=1'b1;
            end
       end
       
      always @(vcnt or reset)  begin
         if(!reset)
            vs<=1'b1;
          else begin
          if((vcnt>=480+8+2) && (vcnt<480+8+2+2))
              vs<=1'b0;
              else
                vs<=1'b1;
                end
            end
            
     always @(posedge clk25M or negedge reset) begin
          if(!reset)
              VGA_D<=1'b0;
           else begin
               if(hcnt<10'd640 & vcnt <10'd480 && dis_en) 
               VGA_D <={rgb[0],rgb[0],rgb[0],rgb[0],rgb[1],rgb[1],rgb[1],rgb[1],rgb[2],rgb[2],rgb[2],rgb[2]};
               else begin
                  VGA_D<=1'b0;
                end
            end
        end
        
endmodule