module count_16(clk,rst,data);
input clk,rst;
output[3:0] data;
reg[3:0] data;
always @(posedge clk or posedge rst)

if(rst==1)  data <= 4'b0000;
else 
data <= data+1;

endmodule
