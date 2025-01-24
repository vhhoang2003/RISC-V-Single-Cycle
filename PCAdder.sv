module AddPC4(FromPC, NexttoPC);

input [31:0] FromPC;
output [31:0] NexttoPC;

assign NexttoPC = FromPC + 32'h00000004;

endmodule