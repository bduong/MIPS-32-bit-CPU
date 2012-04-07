`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:32 11/10/2010 
// Design Name: 
// Module Name:    twox1_5bit 
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
module twox1_5bit(In0,In1,Sel,out
    );
	 
input [4:0] In0,In1;
input Sel;
output [4:0] out;

reg [4:0] out;

always @(In0 or In1 or Sel)
begin
case(Sel)
0: out <= In0;
1: out <= In1;
default: out<= 4'bxxxx;
endcase
end

endmodule
