`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:39:08 11/12/2010
// Design Name:   CPU
// Module Name:   /ad/eng/users/b/d/bduong/EC413_xilinx/CPUProject/CPU/CPU_Test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_Test;

	// Inputs
	reg Reset;
	reg Clk;

	// Outputs
	wire [31:0] ALUOut;
	wire [3:0] State;


	reg [8:0] IN;
	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.Reset(Reset), 
		.Clk(Clk), 
		.ALUOut(ALUOut),
		.State(State)
	);

	initial begin
		// Initialize Inputs
		Reset = 0;
		Clk = 0;

	end
      always begin
		#20 Clk = 1; Reset = 1;
		#20 Clk = 0; Reset = 1;
		for (IN = 0; IN < 200;IN = IN +1) begin
			#20 Clk = 1; Reset = 0;
			#20 Clk = 0; Reset = 0;
		end
	/*	#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;
		#20 Clk = 1; Reset = 0;
		#20 Clk = 0; Reset = 0;*/
		
		
		
		#20 $finish;
		end
endmodule

