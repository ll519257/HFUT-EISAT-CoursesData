module div20m(inclk,outclk);
input inclk;
output outclk;
reg outclk;
reg[25:0] counter;
always @(posedge inclk)
begin 
if(counter ==4999999) counter <=0;
else counter <= counter +1;
end
always @(counter)
begin 
if(counter ==4999999) outclk  <=1;
else outclk <= 0;
end
endmodule