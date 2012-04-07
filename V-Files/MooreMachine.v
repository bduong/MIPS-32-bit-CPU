`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:31 10/26/2010 
// Design Name: 
// Module Name:    MooreMachine 
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
module MooreMachine(
    input [0:0] Reset,
    input [0:0] Clk,
    input [5:0] Opcode,
	 output MemWrite,
	 output ALUSrcA,
	 output [1:0] ALUSrcB,
	 output [3:0] ALUOp,
	 output IRWrite,
	 output PCWrite,
	 output [1:0] PCSrc,
	 output [1:0] Branch,
	 output RegSrc,
	 output RegWrite,
	 output SN,
	 output [3:0] Stateout
    );

reg [3:0] State;
wire [1:0]load;

reg MemWrite;
reg ALUSrcA;
reg [1:0] ALUSrcB;
reg [3:0] ALUOp;
reg IRWrite;
reg PCWrite;
reg [1:0] PCSrc;
reg [1:0] Branch;
reg RegSrc;
reg RegWrite;
reg SN;


reg [1:0] branchif;
reg readR1;



LoadSave_Dec OpDecoder(	//This checks to see if the instruction is LW or SW or other
	.Opcode(Opcode),
	.Load(load)
	);
	
always @(Opcode)
begin
case(Opcode[3:0])
0: branchif = 2'b01;
1: branchif = 2'b10;
default: branchif = 2'b00;
endcase
end

always@(Opcode)
begin
case(Opcode)
6'b100000: readR1 = 1'b0;
6'b100001: readR1 = 1'b0;
6'b111001: readR1 = 1'b0;
6'b111010: readR1 = 1'b0;
6'b111100: readR1 = 1'b0;
default: readR1 = 1'b1;
endcase

end
	
	


always @(posedge Clk) begin
if(Reset)begin
State <= 4'b1111;
end else if(Opcode == 0)begin
State <= 0;
end else begin
casez ({State,Opcode[5:4],load})
8'b1111_zz_zz:State <= 0;//from initial reset
//8'b1110_zz_zz:State <= 0;
8'b0000_zz_zz:State <= 1; //State 0
8'b0001_00_zz:State <= 9; //State 1 jump
8'b0001_01_zz:State <= 6;	//R-type
8'b0001_10_zz:State <= 8;
8'b0001_11_0z:State <= 2; //Immediate Logical/Arth
8'b0001_11_11:State <= 3; //LW 
8'b0001_11_10:State <= 5; //SW
8'b0010_zz_zz:State <= 7; //State 2
8'b0011_zz_zz:State <= 4; //State 3
8'b0100_zz_zz:State <= 0; //State 4
8'b0101_zz_zz:State <= 0; //State 5
8'b0110_zz_zz:State <= 7; //State 6
8'b0111_zz_zz:State <= 0; //State 7
8'b1000_zz_zz:State <= 0; //State 8
8'b1001_zz_zz:State <= 0; //State 9
default: State <= 0;
endcase
end
end

assign Stateout = State;

always @(State)begin
casez(State)
0:	begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b0;
		ALUSrcB <= 'b01;
		ALUOp <= 'b0010;
		IRWrite <= 'b1;
		PCWrite <= 'b1;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
		//SN <= 1'b1;
	end
1:begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b0;
		ALUSrcB <= 'b11;
		ALUOp <= 'b0010;
		IRWrite <= 'b0;
		PCWrite <= 'b0;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
	//	SN <= readR1;
	end
2:begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b1;
		ALUSrcB <= 'b10;
		ALUOp <= Opcode[3:0];
		IRWrite <= 'b0;
		PCWrite <= 'b0;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
	//	SN <= 'b1;
	end
3:begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b0;
		ALUSrcB <= 'b00;
		ALUOp <= 'b0000;
		IRWrite <= 'b0;
		PCWrite <= 'b0;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
		//SN <= 'b1;
	end
4:begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b0;
		ALUSrcB <= 'b00;
		ALUOp <= 'b0000;
		IRWrite <= 'b0;
		PCWrite <= 'b0;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b1;
		RegWrite <= 'b1;
		//SN <= 'b1;
	end
5:begin
		MemWrite <= 'b1;
		ALUSrcA <= 'b0;
		ALUSrcB <= 'b00;
		ALUOp <= 'b0000;
		IRWrite <= 'b0;
		PCWrite <= 'b0;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
		//SN <= 'b1;
	end
6:begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b1;
		ALUSrcB <= 'b00;
		ALUOp <= Opcode[3:0];
		IRWrite <= 'b0;
		PCWrite <= 'b0;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
		//SN <= 'b1;
	end
7:begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b0;
		ALUSrcB <= 'b00;
		ALUOp <= 'b0000;
		IRWrite <= 'b0;
		PCWrite <= 'b0;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b1;
		//SN <= 'b1;
	end
8:begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b1;
		ALUSrcB <= 'b00;
		ALUOp <= 'b0000;
		IRWrite <= 'b0;
		PCWrite <= 'b0;
		PCSrc <= 'b01;
		//Branch <= branchif;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
		//SN <= 'b1;
	end
9:begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b0;
		ALUSrcB <= 'b00;
		ALUOp <= 'b0000;
		IRWrite <= 'b0;
		PCWrite <= 'b1;
		PCSrc <= 'b10;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
		//SN <= 'b1;
	end
	default:
	begin
		MemWrite <= 'b0;
		ALUSrcA <= 'b0;
		ALUSrcB <= 'b00;
		ALUOp <= 'b0000;
		IRWrite <= 'b1;
		PCWrite <= 'b0;
		PCSrc <= 'b00;
		//Branch <= 'b00;
		RegSrc <= 'b0;
		RegWrite <= 'b0;
	//	SN <= 'b1;
	end
endcase
end

always@(State or readR1)
begin
if(State == 1 && readR1 == 0)
SN <= 1'b0;
else
SN <= 1'b1;
end

always@(State or branchif)
begin
if(State == 8)
Branch <= branchif;
else
Branch <= 2'b00;
end









endmodule
