module state(rst,in,clk,a,b,res);
input clk;
input in,rst;
input[7:0]a,b;
output res;
reg res;
reg[1:0] state;
parameter s0 = 2'b00,s1 = 2'b01,s2 = 2'b10,s3= 2'b11;
always @(posedge clk)
begin 
if(rst) state = 0;
else case(state)
s0:if(in) state <=s1; else state <= s0;
s1:if(in) state <=s2; else state <= s0;
s2:if(in) state <=s1; else state <= s3;
s3:if(in) state <=s1; else state <= s0;
default:state = s0;
endcase
end
always @(state )
begin
	if(state == s3 && !in) res = a;
else res =b;
end
endmodule
