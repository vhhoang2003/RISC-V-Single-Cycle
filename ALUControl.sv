module ALU_Control(ALUOp_in, func7, func3, ALUControl_out);

input [1:0] ALUOp_in;
input [31:25] func7;
input [14:12] func3;

output reg [ 3:0 ] ALUControl_out;

always @ (*) 
	begin 
		case ({ALUOp_in, func7, func3})
			12'b00_0000000_000 : ALUControl_out = 4'b0010;
			12'b01_0000000_000 : ALUControl_out = 4'b0110;
			12'b10_0000000_000 : ALUControl_out = 4'b0010;
			12'b10_0100000_000 : ALUControl_out = 4'b0110;
			12'b10_0000000_111 : ALUControl_out = 4'b0000;
			12'b10_0000000_110 : ALUControl_out = 4'b0001;
			default				 : ALUControl_out = 4'bxxxx;
		endcase
	end
	
endmodule
			