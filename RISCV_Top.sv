module RISCV_Top(
input clk, reset
);

// Instantiation of module

//Wire of 32 bit that connect the output of program counter to the input instruction memory

wire [31:0] instructionTop, instructionTopOut, read_dataTop1, read_dataTop2,
 ALUResultTop, NextInstruction;
wire [3:0] ALUControlTop;
wire RegWireTop;
wire MemWireTop, MemReadTop;
wire [1:0] ALUOpTop;


// Program Counter
Program_Counter Program_Counter
(
.clk(clk), 
.reset(reset),
.PC_in( ),
.PC_out(instructionTop)
);

// Instruction Memory
Instruction_Memory Instruction_Memory
(
.reset( reset ),
.read_address( instructionTop ), 
.instruction_out( instructionTopOut )
);

// Register File
Register_File Register_File
(
.clk( clk ), 
.reset( reset ),
.read_Register1( instructionTopOut ),
.read_Register2( instructionTopOut ),
.write_Register( instructionTopOut ),
.write_Data( ALUResultTop ), 
.regWrite( RegWireTop ), 
.read_Data1( read_dataTop1), 
.read_Data2( read_dataTop2 )
);

// ALU 
ALU ALU
(
.A( read_dataTop1 ), 
.B( read_dataTop2 ), 
.ALUControl_in( ALUControlTop ),
.ALU_result( ALUResultTop )
);

// Data Memory
Data_Memory Data_Memory
(
.clk( clk ), 
.reset( reset ), 
.Address( ALUResultTop ), 
.Write_data( read_dataTop2 ),
.Read_data(), 
.Mem_write( MemWireTop ), 
.Mem_read( MemReadTop )
);

// ALU Control 
ALU_Control ALU_Control
(
.ALUOp_in( ALUOpTop ), 
.func7( instructionTopOut ), 
.func3( instructionTopOut ), 
.ALUControl_out( ALUControlTop )
);

// CU
Control_Unit(
.Opcode(), 
.branch(), 
.MemRead( MemReadTop ), 
.MemtoReg(), 
.MemWrite( MemWireTop ), 
.ALUScr( ALUScrTop ), 
.RegWrite( RegWireTop ), 
.ALUOp_out( ALUOpTop )
);

// Adder

// Add PC_out and 4
AddPC4 AddPC4(
.FromPC( instructionTop ), 
.NexttoPC( NextInstruction )
);

// Add PC_Out and Imm Gen

Adder(
.Adder_in_1(), 
.Adder_in_2(), 
.Adder_result()
);

//Multiplexer

//MUX 1

Mux1 Mux1( 
.se1(), 
.A1(), 
.B1(), 
.Mux1_out()
);

//MUX 2

Mux1 Mux2( 
.se1(), 
.A1(), 
.B1(), 
.Mux1_out()
);

endmodule