module Control_Unit(reset, Opcode, branch, MemRead, MemtoReg, MemWrite, ALUScr, RegWrite, ALUOp_out);
	
	input reset;
	input [6:0] Opcode;
	output reg branch, MemRead, MemtoReg, MemWrite, ALUScr, RegWrite;
	output reg [ 1:0 ] ALUOp_out;

always @ (*)
begin
	if (reset)
	begin
	{ALUScr, MemtoReg, RegWrite, MemRead, MemWrite, branch, ALUOp_out} <= 7'b0000000;
	end
	else begin
	case(Opcode)
		7'b0110011: // R-type instruction
			begin
				branch <= 0;
				MemRead <= 0;
				MemtoReg <= 0;
				MemWrite <= 0;
				ALUScr <= 0;
				RegWrite <= 1;
				ALUOp_out <= 2'b10;
			end
			
		7'b0000011: // Load instruction
		begin
				branch <= 0;
				MemRead <= 0;
				MemtoReg <= 1;
				MemWrite <= 0;
				ALUScr <= 1;
				RegWrite <= 1;
				ALUOp_out <= 2'b00;
			end
			
		7'b0100011: // Store instruction
		begin
				branch <= 0;
				MemRead <= 0;
				MemtoReg <= 0;
				MemWrite <= 1;
				ALUScr <= 1;
				RegWrite <= 1;
				ALUOp_out <= 2'b00;
			end
			
		7'b1100011: // Branch-equal instruction
		begin
				branch <= 1;
				MemRead <= 0;
				MemtoReg <= 0;
				MemWrite <= 0;
				ALUScr <= 0;
				RegWrite <= 0;
				ALUOp_out <= 2'b01;
			end

		7'b0000011: // Same as R-type
		begin
				branch <= 0;
				MemRead <= 0;
				MemtoReg <= 0;
				MemWrite <= 0;
				ALUScr <= 0;
				RegWrite <= 1;
				ALUOp_out <= 2'b10;
			end
		endcase
	end
end

endmodule