`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:01:13 10/04/2010 
// Design Name: 
// Module Name:    ALU_Top 
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
module ALU_Top(
    R1,
	 R2,
	 R3,
	 Opcode
//	 overflow
    );
parameter width = 32;

output [width-1:0] R1;
input [width-1:0] R2;
input [width-1:0] R3;
input [3:0] Opcode;
//output [0:0] overflow;



wire [width-1:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15;
wire c1,cdiscard,o1,c2;
wire overflow;

//move
OR_32bit MOVE(
	.A(R2),
	.B(32'b0),
	.Out(m0)
	);

//not
not NOT [width-1:0] (m1,R2);

//add
CS_Adder ADD(
	.A(R2),
	.B(R3),
	.Out(m2),
	.Cout(c1),
	.overflow(over1)
	);

//sub
Sub_32 SUB(
	.A(R2),
	.B(R3),
	.Out(m3),
	.Cout(c2),
	.overflow(over2)
	);
	
//OR
OR_32bit OR(
	.A(R2),
	.B(R3),
	.Out(m4)
	);
	
//AND
AND_32bit AND(
	.A(R2),
	.B(R3),
	.Out(m5)
	);
	
//XOR
Xor_32 XOR(
	.A(R2),
	.B(R3),
	.Out(m6)
	);
	
//SLT
Less_Than_S SLT(
	.A(R2),
	.B(R3),
	.Out(m7)
	);
	
//SLTU
Less_Than_U SLTU(
	.A(R2),
	.B(R3),
	.Out(m8)
	);


assign m9 = {R2[31:16],R3[15:0]};


assign m10 = {R3[15:0],R2[15:0]};


and AND11 [width-1:0](m11,1'b0,1'b0);
and AND12 [width-1:0](m12,1'b0,1'b0);
and AND13 [width-1:0](m13,1'b0,1'b0);
and AND14 [width-1:0](m14,1'b0,1'b0);
and AND15 [width-1:0](m15,1'b0,1'b0);

	
	
//MUX

ALU_MUX MUX(
	.In0({1'b0,m0}),
	.In1({1'b0,m1}),
	.In2({over1,m2}),
	.In3({over2,m3}),
	.In4({1'b0,m4}),
	.In5({1'b0,m5}),
	.In6({1'b0,m6}),
	.In7({1'b0,m7}),
	.In8({1'b0,m8}),
	.In9({1'b0,m9}),
	.In10({1'b0,m10}),
	.In11({1'b0,m11}),
	.In12({1'b0,m12}),
	.In13({1'b0,m13}),
	.In14({1'b0,m14}),
	.In15({1'b0,m15}),
	.opcode(Opcode),
	.Out({overflow,R1})
	);

endmodule
