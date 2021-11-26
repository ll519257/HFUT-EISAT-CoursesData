module tryfun(clk,n,res,rst);
output[31:0] res;
input[3:0] n;
input rst,clk;
reg[331:0] res;
always @(posedge clk)
begin
if(!rst) res<=0;
else 
begin
res <= fun(n);
end
end
function [31:0]fun;
input[3:0] op;
integer i;
begin
fun = op?1:0;
for(i=2;i<=op;i = i+1)
fun = i *fun;
end
endfunction
endmodule 