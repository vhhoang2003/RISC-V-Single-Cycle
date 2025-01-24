module Imediate_Generator(instruction, I, S, SB);

input signed [31:0] instruction;
output reg signed [31:0] I, S, SB;

always @ (*) begin
    // Extracting fields using part-select and sign extension
    I  = {{20{instruction[31]}}, instruction[31:20]}; // Immediate
    S  = {{20{instruction[31]}}, instruction[30:25], instruction[11:7]}; // Store
    SB = {{19{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // Branch
end

endmodule
