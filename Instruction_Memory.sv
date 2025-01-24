module Instruction_Memory(clk, reset, read_address, instruction_out);

input clk, reset;
input [31:0] read_address;
output [31:0] instruction_out;

reg [31:0] IMemory [63:0]; // Memory consist of 64 registers each 32 bit wide
integer count;
assign instruction_out = IMemory[read_address]; // Assign what is placed at memory address to instruction out


always @ (posedge clk)
	begin
		if( reset == 1'b1)
			begin
				for( count = 0; count < 64; count += 1 );
					begin
						IMemory[ count ] = 32'h00000000;
				end
			 end
		else if ( reset == 1'b0)
			IMemory[0] = 32'b00000000_11001_01010_000_01010_0110011; 	// add x10, x10, x25
			IMemory[4] = 32'b00000000_11001_01010_000_01010_0110011;		//	add x10, x10, x25
			IMemory[8] = 32'b00000000_00000_01010_011_01001_0000011;		// lw x9, 0(x10)
			IMemory[12] = 32'b00000000_11000_01001_001_01100_1100011;	// bne x9, x24, Exit
			IMemory[16] = 32'b00000000_00001_10110_000_10110_0010011;	// addi x22, x22, 1
			IMemory[20] = 32'b00000000_00000_00000_000_01101_1100011;	// beq x0, x0, loop
		end
	
endmodule