`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:22 11/10/2010 
// Design Name: 
// Module Name:    Instr_Decode 
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
module Instr_Decode(
	Instruction, Opcode, R1, R2, R3, Immediate, Jump
    );

input [31:0] Instruction;
output [5:0] Opcode;
output [4:0] R1;
output [4:0] R2;
output [4:0] R3;
output [15:0] Immediate;
output [25:0] Jump;

assign Opcode = Instruction [31:26];
assign R1 = Instruction[25:21];
assign R2 = Instruction[20:16];
assign R3 = Instruction[15:11];
assign Immediate = Instruction[15:0];
assign Jump = Instruction[25:0];





endmodule
