module Register_File(clk, reset, read_Register1, read_Register2,write_Register,
 write_Data, regWrite, read_Data1, read_Data2);

input clk, reset, regWrite;
input [19:15] read_Register1; 	// 5-bit
input [24:20] read_Register2;		// 5-bit
input [11:7]  write_Register;	// 5-bit

input [31:0] write_Data; // 32-bit write data

output [31:0] read_Data1;
output [31:0] read_Data2;

reg [31:0] Registers [31:0]; // 32 registers each of 32-bit wide

integer count;

initial
begin

Registers[0]  = 32'd0;
Registers[1]  = 32'd1;
Registers[2]  = 6;
Registers[3]  = 34;
Registers[4]  = 5;
Registers[5]  = 8;
Registers[6]  = 2;
Registers[7]  = 67;
Registers[8]  = 56;
Registers[9]  = 45;
Registers[10] = 50;
Registers[11] = 41;
Registers[12] = 24;
Registers[13] = 23;
Registers[14] = 24;
Registers[15] = 35;
Registers[16] = 46;
Registers[17] = 57;
Registers[18] = 68;
Registers[19] = 29;
Registers[20] = 30;
Registers[21] = 41;
Registers[22] = 52;
Registers[23] = 53;
Registers[24] = 44;
Registers[25] = 75;
Registers[26] = 56;
Registers[27] = 57;
Registers[28] = 48;
Registers[29] = 39;
Registers[30] = 80;
Registers[31] = 91;

end

always @ (posedge clk)
	begin
		if(reset == 1'b1)
			begin
				for(count = 0; count < 32; count+= 1 )
					begin
						Registers[count] <= 32'h0;
					end
			end
		else if (regWrite == 1'b1) 
			begin
				Registers[write_Register] = write_Data;
			end
		end
		
	assign read_Data1 = Registers[read_Register1];
	assign read_Data2 = Registers[read_Register2];

endmodule