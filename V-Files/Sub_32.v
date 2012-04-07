`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:43 10/04/2010 
// Design Name: 
// Module Name:    Sub_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Sub_32(
    A,
	 B,
	 Out,
	 Cout,
	 overflow
    );

parameter width = 32;

input [(width-1):0] A;
input [(width-1):0] B;
output [(width-1):0] Out;
output [0:0] Cout;
output [0:0] overflow;


wire [(width-1):0] invertB, twocompB;
wire cdiscard,c2,c3;
	
not NO1 [(width-1):0] (invertB,B);

CS_Adder TWOCOMP(
	.A(invertB),
	.B(1),
	.Out(twocompB),
	.Cout(c2),
	.overflow(cdiscard)
	);
	
CS_Adder SUB(
	.A(A),
	.B(twocompB),
	.Out(Out),
	.Cout(c3),
	.overflow(overflow)
	);
	
xor_1bit XOR1(
	.A(c2),
	.B(c3),
	.Out(Cout)
	);

endmodule
