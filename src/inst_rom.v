module ROM(
    input wire [15:0] PC,
    input wire clk,
    output reg [31:0] instr



);

reg [31:0] rom[0:255];
initial begin
    $readmemh("program.hex", rom); 
end
always @(posedge clk)
begin
instr<=rom[pc];
end

endmodule;