`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:01 10/04/2010 
// Design Name: 
// Module Name:    OR_32bit 
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
module OR_32bit(
		A,
		B,
		Out
    );
	 
	 
	 parameter width = 32;
	 
	 input [width-1:0] A;
    input [(width-1):0] B;
    output [(width-1):0] Out;

or OR1 [width-1:0](Out,A,B);






endmodule
