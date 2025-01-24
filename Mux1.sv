module Mux1( se1, A1, B1, Mux1_out);

input se1;
input [31:0] A1, B1;
output [31:0] Mux1_out;

assign Mux1_out = (se1 == 1'b0) ? A1: B1;

endmodule