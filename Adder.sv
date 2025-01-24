module Adder(Adder_in_1, Adder_in_2, Adder_result);

input [31:0] Adder_in_1, Adder_in_2;
output [31:0] Adder_result;

assign Adder_result = Adder_in_1 + Adder_in_2;

endmodule

