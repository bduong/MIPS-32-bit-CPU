`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:13:39 10/04/2010 
// Design Name: 
// Module Name:    ALU_MUX 
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
module ALU_MUX(
    In0,
	 In1,
	 In2,
	 In3,
	 In4,
	 In5,
	 In6,
	 In7,
	 In8,
	 In9,
	 In10,
	 In11,
	 In12,
	 In13,
	 In14,
	 In15,
	 opcode,
	 Out
    );

	parameter width = 32;
	
	 input [width:0] In0;
    input [width:0] In1;
    input [width:0] In2;
    input [width:0] In3;
    input [width:0] In4;
    input [width:0] In5;
    input [width:0] In6;
    input [width:0] In7;
    input [width:0] In8;
    input [width:0] In9;
    input [width:0] In10;
    input [width:0] In11;
    input [width:0] In12;
    input [width:0] In13;
    input [width:0] In14;
    input [width:0] In15;
    input [3:0] opcode;
    output [width:0] Out;



wire [3:0] notopcode;
wire [width:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15;

not NOT1 [3:0](notopcode,opcode);

and ANDX0  [width:0] (m0,In0,notopcode[3],notopcode[2],notopcode[1],notopcode[0]);
and ANDX1  [width:0] (m1,In1,notopcode[3],notopcode[2],notopcode[1],opcode[0]);
and ANDX2  [width:0] (m2,In2,notopcode[3],notopcode[2],opcode[1],notopcode[0]);
and ANDX3  [width:0] (m3,In3,notopcode[3],notopcode[2],opcode[1],opcode[0]);
and ANDX4  [width:0] (m4,In4,notopcode[3],opcode[2],notopcode[1],notopcode[0]);
and ANDX5  [width:0] (m5,In5,notopcode[3],opcode[2],notopcode[1],opcode[0]);
and ANDX6  [width:0] (m6,In6,notopcode[3],opcode[2],opcode[1],notopcode[0]);
and ANDX7  [width:0] (m7,In7,notopcode[3],opcode[2],opcode[1],opcode[0]);
and ANDX8  [width:0] (m8,In8,opcode[3],notopcode[2],notopcode[1],notopcode[0]);
and ANDX9  [width:0] (m9,In9,opcode[3],notopcode[2],notopcode[1],opcode[0]);
and ANDX10 [width:0] (m10,In10,opcode[3],notopcode[2],opcode[1],notopcode[0]);
and ANDX11 [width:0] (m11,In11,opcode[3],notopcode[2],opcode[1],opcode[0]);
and ANDX12 [width:0] (m12,In12,opcode[3],opcode[2],notopcode[1],notopcode[0]);
and ANDX13 [width:0] (m13,In13,opcode[3],opcode[2],notopcode[1],opcode[0]);
and ANDX14 [width:0] (m14,In14,opcode[3],opcode[2],opcode[1],notopcode[0]);
and ANDX15 [width:0] (m15,In15,opcode[3],opcode[2],opcode[1],opcode[0]);

or ORX [width:0] (Out,m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15);

endmodule
