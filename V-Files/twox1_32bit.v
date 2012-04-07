`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:11 11/11/2010 
// Design Name: 
// Module Name:    twox1_32bit 
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
module twox1_32bit(In0,In1,Sel,out
    );
	 
input [31:0] In0,In1;
input Sel;
output [31:0] out;

reg [31:0] out;

always @(In0 or In1 or Sel)
begin
case(Sel)
0: out <= In0;
1: out <= In1;
default: out<= 32'hxxxxxxxx;
endcase
end


endmodule
