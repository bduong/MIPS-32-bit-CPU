`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:13 11/12/2010 
// Design Name: 
// Module Name:    CPU 
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
module CPU(Reset, Clk, ALUOut,State
    );
	 
input Reset;
input Clk;
output [31:0] ALUOut;
output [3:0] State;

wire MemWrite, ALUSrcA, IRWrite, PCWrite, RegSrc, RegWrite, SN;
wire [1:0] ALUSrcB, PCSrc, Branch;
wire [3:0] ALUOp;
wire [5:0] OpcodeOut;

DataPathTop DataPath(
	.Reset(Reset),
	.Clk(Clk),
	.MemWrite(MemWrite),
	.ALUSrcA(ALUSrcA),
	.ALUSrcB(ALUSrcB),
	.ALUOp(ALUOp),
	.IRWrite(IRWrite),
	.PCWrite(PCWrite),
	.PCSrc(PCSrc),
	.Branch(Branch),
	.RegSrc(RegSrc),
	.RegWrite(RegWrite),
	.SN(SN),
	.ALUOutput(ALUOut),
	.OpcodeOut(OpcodeOut)
);


MooreMachine Controller(
	.Reset(Reset),
	.Clk(Clk),
	.Opcode(OpcodeOut),
	.MemWrite(MemWrite),
	.ALUSrcA(ALUSrcA),
	.ALUSrcB(ALUSrcB),
	.ALUOp(ALUOp),
	.IRWrite(IRWrite),
	.PCWrite(PCWrite),
	.PCSrc(PCSrc),
	.Branch(Branch),
	.RegSrc(RegSrc),
	.RegWrite(RegWrite),
	.SN(SN),
	.Stateout(State)
);



endmodule
