// IMem
//
// A module used to mimic Instruction memory, for the EC413 project.
// Returns hardcoded instructions based on the current PC.
//
// DATA_WIDTH: instruction and data width (i.e 32 bits).
//
`timescale 1ns / 1ps
// ----------------------------------------------------
// IMPORTANT!
// Which test program to use:
// - PROGRAM_1: first simple hello world example.
`define PROGRAM_1
// Change the previous line to try a different program,
// when available.
// ----------------------------------------------------

module IMem(PC,          // PC (address) of instruction in IMem
            Instruction, // 
				Clk);

parameter DATA_WIDTH= 32;
`ifdef PROGRAM_1
	parameter PROG_LENGTH= 16;
`endif
//-------------Input Ports-----------------------------
input [DATA_WIDTH-1:0] PC;
input Clk;
//-------------Output Ports----------------------------
output [DATA_WIDTH-1:0] Instruction;
reg [DATA_WIDTH-1:0] Instruction;
//------------Code Starts Here-------------------------
always @(PC)
begin
case(PC)
`ifdef PROGRAM_1

	//
	// First part: 
	// Load values into:
	// $R0 = -1
	// $R1 = 0
	// $R2 = 2
	// Add $R0 and $R2 and get an answer in $R3: 
	// -1 + 2 = 1
	//

	// LI   $R0, 0xFFFF
	0: Instruction<= 32'b111001_00000_00000_1111111111111111;
	// LUI  $R0, 0xFFFF
	1: Instruction<= 32'b111010_00000_00000_1111111111111111;
	// LI   $R1, 0x0000
	2: Instruction<= 32'b111001_00001_00000_0000000000000000;
	// LUI  $R1, 0x0000
	3: Instruction<= 32'b111010_00001_00000_0000000000000000;
	// LI   $R2, 0x0002
	4: Instruction<= 32'b111001_00010_00000_0000000000000010;
	// LUI  $R2, 0x0000
	5: Instruction<= 32'b111010_00010_00000_0000000000000000;
	// ADD  $R3, $R0, $R2
	6: Instruction<= 32'b010010_00011_00000_00010_00000000000;

	//
	// Second part: store and load, should store $R3
	// (contains 1) into address 5.  Then load from 
	// address 5 into register $R1.  $R1 should then 
	// contain 1.
	//

	// SWI  $R3, [0x5]
	7: Instruction<= 32'b111100_00011_00000_0000000000000101;
	// LWI  $R1, [0x5]
	8: Instruction<= 32'b111011_00001_00000_0000000000000101;


	//
	// Third part: simple loop test, loop $R0 from -1 to 1
	//

	// ADDI $R0, $R0, 0x0001
	9: Instruction<= 32'b110010_00000_00000_0000000000000001;
	// SLT  $R31, $R0, $R1
	10: Instruction<= 32'b010111_11111_00000_00001_00000000000;
	// BNEZ $R31, 0xFFFD
	11: Instruction<= 32'b100001_11111_00000_1111111111111101;

	//
	// Fourth part: test jump by _skipping_ load instructions
	// at PCs 13 and 14.  Contents of $R0 should still be 1.
	// Afterwards 1 is subtracted with SUBI and final output 
	// should be 0.
	//

	// J    15
	12: Instruction<= 32'b000001_00000000000000000000001111;
	// LI   $R0, 0xFFFF
	13: Instruction<= 32'b111001_00000_00000_1111111111111111;
	// LUI  $R0, 0xFFFF
	14: Instruction<= 32'b111010_00000_00000_1111111111111111;
	// SUBI $R0, $R0, 0x0001
	15: Instruction<= 32'b110011_00000_00000_0000000000000001;
`endif
	default: Instruction<= 0; //NOOP
endcase
end

endmodule
	
