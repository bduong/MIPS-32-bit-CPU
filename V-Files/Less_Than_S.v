`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:22:31 10/04/2010 
// Design Name: 
// Module Name:    Less_Than_S 
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
module Less_Than_S(
    A,
	 B,
	 Out
    );
	 
	parameter width =32; 
	input [width-1:0] A;
   input [width-1:0] B;
   output [width-1:0] Out;
	 
	 
	wire [width-1:0] difference;
	wire c1,overflow,notover,d1,m1,m2;

Sub_32 sub1(
	.A(A),
	.B(B),
	.Out(difference),
	.Cout(c1),
	.overflow(overflow)
	);


//assign Out = difference;
not NOT1(notover,overflow);
not NOT2(d1,difference[width-1]);
and AND1(m1,notover,difference[width-1]);
and AND12 (m2,overflow,d1);


or ORY (Out[0],m1,m2);
or ORX [width-2:0] (Out[width-1:1],1'b0,1'b0);



endmodule
