`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:57 10/04/2010 
// Design Name: 
// Module Name:    Xor_32 
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
module Xor_32(
    A,
	 B,
	 Out
    );

parameter width = 32;

input [width-1:0] A;
input [width-1:0] B;
output [width-1:0] Out;
	 
xor_1bit XOR1 [width-1:0](
	.A(A),
	.B(B),
	.Out(Out[width-1:0])
	);

endmodule
