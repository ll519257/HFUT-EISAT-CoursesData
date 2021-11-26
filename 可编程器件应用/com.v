module com(a_great,b_great,equal,a,b);
input[7:0] a,b;
output a_great,b_great,equal;
reg a_great,b_great,equal;
always @(a,b)
begin if(a>b)a_great=1;
else a_great = 0;
if(a<b) b_great=1;
else b_great = 0;
if(a == b) equal = 1;
else equal =0;
end
endmodule