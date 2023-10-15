module cnt7b(
  input clk,
  input reset,
  input en,
  output reg[6:0] q

 );
 always @ (posedge clk, posedge reset)
  if(reset)
  q<=0;
  else if(en)
  q<=q+1'b1;
  
endmodule