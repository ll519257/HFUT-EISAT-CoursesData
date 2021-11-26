module	halfadder(A,B,CO,S);
	input A,B;
	output CO,S;
	wire S,CO;
	assign S = A ^ B;
	assign CO = A & B;
endmodule
