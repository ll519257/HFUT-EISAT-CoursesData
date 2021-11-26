`timescale 1ns/100ps
module Gen_clk1(clock1,c_s);
output clock1,c_s;
reg clock1;
wire c_s;
initial clock1 = 0;
always #10 clock1= ~clock1;
assign #2 c_s=clock1;
endmodule
