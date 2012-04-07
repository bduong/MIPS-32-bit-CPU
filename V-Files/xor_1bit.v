
module xor_1bit(

	input [0:0] A,
	input [0:0] B,
	output [0:0] Out
	);

	wire  w1,w2,w3;

	and AN1 (w1,A,B);		//This does the xor of A and B
	not NO1 (w2,w1);
	or OR1 (w3,A,B);
	and AN2 (Out,w2,w3);




endmodule
