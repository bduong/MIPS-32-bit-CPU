`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:28 10/18/2010 
// Design Name: 
// Module Name:    extendMux 
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
module extendMux(
    input [3:0] opcode,
    output [0:0] Extend
    );

wire [3:0] notopcode;

not NOT1 [3:0](notopcode,opcode);

//ADD SUB SLT AND MOVE2 are the operations that use sign extension
and ANDX0  (m0,1'b0,notopcode[3],notopcode[2],notopcode[1],notopcode[0]);
and ANDX1  (m1,1'b0,notopcode[3],notopcode[2],notopcode[1],opcode[0]);
and ANDX2  (m2,1'b1,notopcode[3],notopcode[2],opcode[1],notopcode[0]);
and ANDX3  (m3,1'b1,notopcode[3],notopcode[2],opcode[1],opcode[0]);
and ANDX4  (m4,1'b0,notopcode[3],opcode[2],notopcode[1],notopcode[0]);
and ANDX5  (m5,1'b0,notopcode[3],opcode[2],notopcode[1],opcode[0]);
and ANDX6  (m6,1'b0,notopcode[3],opcode[2],opcode[1],notopcode[0]);
and ANDX7  (m7,1'b1,notopcode[3],opcode[2],opcode[1],opcode[0]);
and ANDX8  (m8,1'b0,opcode[3],notopcode[2],notopcode[1],notopcode[0]);
and ANDX9  (m9,1'b1,opcode[3],notopcode[2],notopcode[1],opcode[0]);
and ANDX10 (m10,1'b0,opcode[3],notopcode[2],opcode[1],notopcode[0]);
and ANDX11 (m11,1'b0,opcode[3],notopcode[2],opcode[1],opcode[0]);
and ANDX12 (m12,1'b0,opcode[3],opcode[2],notopcode[1],notopcode[0]);
and ANDX13 (m13,1'b0,opcode[3],opcode[2],notopcode[1],opcode[0]);
and ANDX14 (m14,1'b0,opcode[3],opcode[2],opcode[1],notopcode[0]);
and ANDX15 (m15,1'b0,opcode[3],opcode[2],opcode[1],opcode[0]);

or EXT (Extend,m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15);

endmodule
