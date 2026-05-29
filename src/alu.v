module alu(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [3:0] alu_control,
    output reg [15:0] alu_result,
    output wire zero
);

always @(*)
begin
case(alu_control)
    4'b0000: alu_result=a+b;
    4'b0001: alu_result=a-b;
    4'b0010: alu_result=a*b;
    4'b0011: alu_result=a&b;
    4'b0100: alu_result=a|b;
    4'b0101: alu_result=a^b;
    default: alu_result=16'h0000;

endcase

end

assign zero = (alu_result == 16'h0000);
    

endmodule