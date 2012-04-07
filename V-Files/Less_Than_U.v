`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:36:23 10/04/2010 
// Design Name: 
// Module Name:    Less_Than_U 
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
module Less_Than_U(
    A,
	 B,
	 Out
    );

	parameter width = 32;
	input [width-1:0] A;
   input [width-1:0] B;
   output [width-1:0] Out;
	
	wire [width-1:0] difference;
	wire overflow,d1,c1,o1,m1,m2;
	

Sub_32 sub2(
	.A(A),
	.B(B),
	.Out(difference),
	.Cout(c1),
	.overflow(overflow)
	);

//not NOT1(d1,c1);
not NOT1(d1,c1);



or ORY(Out[0],d1,1'b0);
or ORX [width-2:0](Out[width-1:1],1'b0,1'b0);


endmodule
