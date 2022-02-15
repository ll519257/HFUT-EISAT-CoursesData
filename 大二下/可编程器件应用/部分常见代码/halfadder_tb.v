`timescale 1ns/100ps
module halfadder_tb(a,b,s,co);
output a,b;
input s,co;
reg a,b;
wire co,s;
halfadder hf1(.A(a),.B(b),.CO(co),.S(s));
initial begin
    a = 0;
    b = 0;
    #10 begin a = 1; b = 1;end
    #10 begin a = 1; b = 0;end
    #10 begin a = 0; b = 1;end
    #10 begin a = 0; b = 0;end
    #10 $stop;
    end
endmodule

