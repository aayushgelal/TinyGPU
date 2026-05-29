module ImmGen(
  input wire [31:0] instr,
  output reg imm_val
);


imm_val=instr[15:0];


endmodule