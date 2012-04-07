`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:42 11/11/2010 
// Design Name: 
// Module Name:    fourx1_32bit 
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
module fourx1_32bit(In0,In1,In2,In3,Sel,Out
    );



input [31:0] In0,In1,In2,In3;
input [1:0] Sel;
output [31:0] Out;

reg [31:0] Out;


always @(In0 or In1 or In2 or In3 or Sel)
begin
case(Sel)
0: Out <= In0;
1: Out <= In1;
2: Out <= In2;
3: Out <= In3;
default: Out <= 32'hxxxxxxxx;
endcase
end
endmodule
