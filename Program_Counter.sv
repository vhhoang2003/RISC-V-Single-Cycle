module Program_Counter(clk, reset, PC_in, PC_out);

input clk, reset;
input [31:0] PC_in; // 32-bit input
output reg [31:0] PC_out; // 32-bit output

always @(posedge clk)
	begin 
		if(reset)
				begin
					PC_out <= 32'h00000000;
				end
		else
			begin
				PC_out <= PC_in;
			end	
	end
endmodule