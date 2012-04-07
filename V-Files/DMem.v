// DMem
//
// A module used to mimic the behavior of a computer's 
// data memory for EC413 Design Project.
//
// This behavioral code generates into single-port RAM on the FPGA.
// Assume the memory contains garbage data (all Xs) until you have
// overwritten it.
//
// ADDRESS_WIDTH: the number of memory addresses is 2 to the power 
// of this number.
//
// DATA_WIDTH: the size of each element in the memory.
//
// Number of word bits DATA_WIDTH.
//
module DMem(WriteData,   // Input data into the memory
            MemData,     // Output data from the memory
            Address,     // Address of data to be read/written
            MemWrite,    // When high, causes write to take place on posedge
            Clk);        // Clock

parameter ADDRESS_WIDTH = 16;
parameter DATA_WIDTH = 32;

//-------------Input Ports-----------------------------
input [DATA_WIDTH-1:0]       WriteData;
input [ADDRESS_WIDTH-1:0]    Address;
input MemWrite;
input Clk;
//-------------Output Ports----------------------------
output [DATA_WIDTH-1:0] MemData;
//-------------Wires-----------------------------------
//-------------Other-----------------------------------
reg [DATA_WIDTH-1:0] mem_contents [2 ** ADDRESS_WIDTH-1:0];
integer i;
//------------Code Starts Here-------------------------

assign MemData= mem_contents[Address];

always @(posedge Clk)
begin
	if(MemWrite)
	begin
		mem_contents[Address]<= WriteData;
	end
end

endmodule
