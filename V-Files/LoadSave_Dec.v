`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:34:34 10/26/2010 
// Design Name: 
// Module Name:    LoadSave_Dec 
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
module LoadSave_Dec(
		input [5:0] Opcode,
		output [1:0] Load
    );
	 
	 reg [1:0] loady;
	 
	always @(Opcode) begin
	
	casez (Opcode)
	6'b000000: loady = 2'b01;
	6'b111011: loady = 2'b11;
	6'b111100: loady = 2'b10;
	default: loady = 2'b00;
	endcase
	end
	assign Load = loady;
	


endmodule
