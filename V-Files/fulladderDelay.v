`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:28:53 09/29/2010 
// Design Name: 
// Module Name:    fulladderDelay 
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
module fulladderDelay(

    input [0:0] A,
    input [0:0] B,
    input [0:0] Cin,
    output [0:0] Out,
    output [0:0] Cout
    );
	 
	 wire w1,w2,w3;
	 wire e1,e2,e3,e4,e5,e6,e7;


and AX1 (e1,A,B);			//This set of gates computes A ^ B
not NX1(e2,e1);
or	OX1(e3,A,B);
and AX2(e4,e2,e3);

and AX3(e5,e4,Cin);			//This set of gates computes A ^ B ^Cin
not NX2(e6,e5);				//and assigns it to the Output
or OX2(e7,e4,Cin);
and AX4(Out,e7,e6);

and AD1(w1,A,B);				//This set of gates computes
and AD2(w2,A,Cin);			// (A&B)|(B&Cin)|(A&Cin)
and AD3(w3,B,Cin);			//	and assigns that to the carry
or OD1(Cout,w1,w2,w3);		// out


endmodule
