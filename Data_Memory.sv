module Data_Memory(clk, reset, Address, Write_data, Read_data, Mem_write, Mem_read);

input clk, reset, Mem_write, Mem_read;
input [31:0] Address, Write_data;
output [31:0] Read_data;

reg [31:0] dataMemory [63:0];

assign Read_Data = (Mem_read) ? dataMemory[ Address ] : 32'h0;

always @ ( posedge clk )
	if( reset == 1'b1 )
		begin
			for ( integer count = 0; count < 64; count += 1 )
				begin
					dataMemory[ count ] <= 32'h0;
				end
		end
	else if ( Mem_write ) 
				begin 
					dataMemory[Address] = Write_data;
				end
				
endmodule
		


 