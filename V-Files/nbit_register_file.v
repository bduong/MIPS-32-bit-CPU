// nbit_register_file
//
// A generic register file which can be parameterized
// by the following:
//
// - number of register select lines REG_SELECT_WIDTH: 
//   number of registers in the file is 2 to the power 
//   of this number.
//
// - number of register bits DATA_WIDTH.
//
// Updates:
// 10/18: Reset fix.
// 10/21: Timing fix.
//
module nbit_register_file(WriteData,   // Input data
                          ReadData1,   // Output data 1
                          ReadData2,   // Output data 2
                          ReadSelect1, // Select lines for output 1
                          ReadSelect2, // Select lines for output 2
                          WriteSelect, // Select lines for input
                          WriteEnable, // Causes write to take place on posedge
                          Reset,       // Synchronous reset
                          Clk);        // Clock

// Register select line size (number of registers is 2 
// to the power of this number).
parameter REG_SELECT_WIDTH = 5;
// Register size in bits.
parameter DATA_WIDTH = 32;

//-------------Input Ports-----------------------------
input [DATA_WIDTH-1:0]       WriteData;
input [REG_SELECT_WIDTH-1:0] ReadSelect1;
input [REG_SELECT_WIDTH-1:0] ReadSelect2;
input [REG_SELECT_WIDTH-1:0] WriteSelect;
input WriteEnable;
input Reset;
input Clk;
//-------------Output Ports----------------------------
output [DATA_WIDTH-1:0] ReadData1;
output [DATA_WIDTH-1:0] ReadData2;
//-------------Wires-----------------------------------
wire [2 ** REG_SELECT_WIDTH-1:0] w_reg_to_outmux [DATA_WIDTH-1:0];
wire [2 ** REG_SELECT_WIDTH-1:0] w_write_select;
//-------------Other-----------------------------------
//reg [REG_SELECT_WIDTH-1:0] read_select1;
//reg [REG_SELECT_WIDTH-1:0] read_select2;
//------------Code Starts Here-------------------------

//Reads combinationally
/*
always @ (posedge Clk) begin
	if (Reset) begin
		read_select1<= 0;
		read_select2<= 0;
	end  else begin
		read_select1<= ReadSelect1;
		read_select2<= ReadSelect2;
	end
end
*/

// Muxes from registers to outputs
generate
	genvar k; // Instance variable
	// Generation for loop
	for(k= 0;k< DATA_WIDTH;k= k+1)
	begin:mux_loop
		nbit_mux #(REG_SELECT_WIDTH) nbitmuxes1 (w_reg_to_outmux[k], ReadData1[k], ReadSelect1);
		nbit_mux #(REG_SELECT_WIDTH) nbitmuxes2 (w_reg_to_outmux[k], ReadData2[k], ReadSelect2);
	end
endgenerate

// Demux to select which register to write to
nbit_demux #(REG_SELECT_WIDTH) writeselect (WriteEnable, w_write_select, WriteSelect);

// Array of D Flip-flops for the registers
generate
	genvar i,j; // Instance variable
	// Generation for loop
	for(i= 0;i< DATA_WIDTH;i= i+1)
	begin:reg_loop1
		 for(j= 0;j< 2 ** REG_SELECT_WIDTH;j= j+1)
		 begin:reg_loop2
			 DFF DFFS (WriteData[i],w_reg_to_outmux[i][j],w_write_select[j],Reset,Clk);
		 end
	end
endgenerate

endmodule
