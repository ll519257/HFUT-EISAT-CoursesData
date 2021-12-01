module select(en,sel,in0,in1,in2,in3,out);
input[7:0]in0,in1,in2,in3;
input [2:0] sel;
input en;
output[7:0] out;
reg[7:0] out;
always @(en or sel or in1 or in2 or in3)
begin out = {8{1'b0}};
if(en==1)
begin 
case(sel)
	2'b00:out=in0;
	2'b01:out=in1;
	2'b10:out=in2;
	2'b11:out=in3;
default:out = {8{1'b0}};
endcase
end
end
endmodule