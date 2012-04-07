`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:53 10/04/2010 
// Design Name: 
// Module Name:    CS_Adder 
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
module CS_Adder(
		A,
		B,
		Out,
		Cout,
		overflow
    );

	parameter width = 32;
	
	input [width-1:0] A;
   input [width-1:0] B;
   output [width-1:0] Out;
	output [0:0] Cout;
	output [0:0] overflow;
	
	
	wire [width-1:1] carry;
	wire c1;
	

fulladderDelay ADD1 [width-1:0](
	.A(A),
	.B(B),
	.Cin({carry[width-1:1],1'b0}),
	.Out(Out),
	.Cout({c1,carry[width-1:1]})
	);
	
or OR1(Cout,c1,1'b0);

xor_1bit xor54543(
	.A(c1),
	.B(carry[width-1]),
	.Out(overflow)
	);


endmodule
