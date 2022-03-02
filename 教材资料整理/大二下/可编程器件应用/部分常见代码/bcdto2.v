module re(data,en,out);
input[3:0] data;
input en;
output[6:0] out;
reg[6:0] out;
always @(data or en)
begin
	out = {7{1'b0}};
	if(en==1)
	begin
	case(data)
	4'b0000 : out [6:0] = 7'b1000000;	4'b0001 : out [6:0] = 7'b1111001;	4'b0010 : out [6:0] = 7'b0100100;	4'b0011 : out [6:0] = 7'b0110000;	4'b0100 : out [6:0] = 7'b0011001;	4'b0101 : out [6:0] = 7'b0010010;	4'b0110 : out [6:0] = 7'b0000010;	4'b0111 : out [6:0] = 7'b1111000;        4'b1000 : out [6:0] = 7'b0000000;	4'b1001 : out [6:0] = 7'b0011000;	default : out [6:0] = {7{1'b0}};
	endcase
	end
end
endmodule