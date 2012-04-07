`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:21 11/10/2010 
// Design Name: 
// Module Name:    DataPathTop 
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
module DataPathTop(
	 input Reset,
	 input Clk,
	 input MemWrite,
	 input ALUSrcA,
	 input [1:0] ALUSrcB,
	 input [3:0] ALUOp,
	 input IRWrite,
	 input PCWrite,
	 input [1:0] PCSrc,
	 input [1:0] Branch,
	 input RegSrc,
	 input RegWrite,
	 input SN,
	 output [31:0] ALUOutput,
	 output [5:0] OpcodeOut
    );
reg Zero;
wire Extend, notZero;
wire [31:0] PCount;
wire [31:0] Instruction, Instruction2;
wire [5:0] Opcode;
wire [4:0] WriteSel, ReadSel1, ReadSel11, ReadSel2;
wire [15:0] Imm;
wire [25:0] JAdd;
wire [31:0] Data1, Data2, R2out,R3out, Src1, Src2, ALUo, ALUOut, NewPC, MemOut, Mem, RegWriteData,ImmEX;

wire Write2PC, PC2, PC3;
always@(Data1)
begin
if (Data1 == 0)
Zero = 1'b1;
else
Zero = 1'b0;
end

not N1(notZero,Zero);

and ANDONE(PC2,Branch[0],Zero);
and ANDTWO(PC3,Branch[1],notZero);

or ORTwo(Write2PC,PCWrite,PC2,PC3);

	nbit_reg PC(
		.nD(NewPC),
		.nQ(PCount),
		.Write(Write2PC),
		.Reset(Reset),
		.Clk(Clk)
	);
		
		
	IMem Instr_Mem(
		.Instruction(Instruction),
		.PC(PCount)
		
	);
	
	nbit_reg InstrReg(
		.nD(Instruction),
		.nQ(Instruction2),
		.Write(IRWrite),
		.Reset(Reset),
		.Clk(Clk)
		);
	
	Instr_Decode InstrDecode(
		.Instruction(Instruction2),
		.Opcode(Opcode),
		.R1(WriteSel),
		.R2(ReadSel1),
		.R3(ReadSel2),
		.Immediate(Imm),
		.Jump(JAdd)
	);
	
//Opcode to controller
assign OpcodeOut = Opcode;

	twox1_5bit ReadSelectMux(
		.In0(WriteSel),
		.In1(ReadSel1),
		.Sel(SN),
		.out(ReadSel11)
	);


	nbit_register_file REGS(
		.WriteData(RegWriteData), 
      .ReadData1(R2out),  
      .ReadData2(R3out),  
      .ReadSelect1(ReadSel11), 
      .ReadSelect2(ReadSel2), 
      .WriteSelect(WriteSel), 
		.WriteEnable(RegWrite), 
      .Reset(Reset),  
      .Clk(Clk)
	
	);
	
	nbit_reg A(
		.nD(R2out),
		.nQ(Data1),
		.Write(1'b1),
		.Reset(Reset),
		.Clk(Clk)
		);
	
	nbit_reg B(
		.nD(R3out),
		.nQ(Data2),
		.Write(1'b1),
		.Reset(Reset),
		.Clk(Clk)
		);
		
	//Sign Extend Mux
	extendMux EX(
		.opcode(ALUOp),
		.Extend(Extend)
		);
		
	wire [15:0] signex; 
	or OREX [15:0] (signex,Imm[15],1'b0);
	
	twox1_32bit ImmMux(
		.In0({16'b0,Imm}),
		.In1({signex,Imm}),
		.Sel(Extend),
		.out(ImmEX)
		);
	
		
//Mux A	
		twox1_32bit SrcA(
			.In0(PCount),
			.In1(Data1),
			.Sel(ALUSrcA),
			.out(Src1)
			);
		
//Mux B
		fourx1_32bit SrcB(
			.In0(Data2),
			.In1(32'b1),
			.In2(ImmEX),
			.In3(ImmEX),
			.Sel(ALUSrcB),
			.Out(Src2)
			);
		
		
	ALU_Top ALU(
		.R1(ALUo),
		.R2(Src1),
		.R3(Src2),
		.Opcode(ALUOp)
	);
	
	

	
	nbit_reg ALUReg(
		.nD(ALUo),
		.nQ(ALUOut),
		.Write(1'b1),
		.Reset(Reset),
		.Clk(Clk)
		);
		
	//PC Mux

		fourx1_32bit PCSrc1(
			.In0(ALUo),
			.In1(ALUOut),
			.In2({6'b0,JAdd}),
			.In3(32'b0),
			.Sel(PCSrc),
			.Out(NewPC)
			);
	 
	 DMem DataMem (
			.WriteData(Data1),  
			.MemData(MemOut),    
			.Address(Imm), 
			.MemWrite(MemWrite),   
			.Clk(Clk)
	 );
	 
	 nbit_reg MemReg(
			.nD(MemOut),
			.nQ(Mem),
			.Write(1'b1),
			.Reset(Reset),
			.Clk(Clk)
			);
	 
	 
	 twox1_32bit RegDataMux(
			.In0(ALUOut),
			.In1(Mem),
			.Sel(RegSrc),
			.out(RegWriteData)
			);
	 
	 assign ALUOutput = ALUOut;
	 
	 
	 
	 

endmodule
