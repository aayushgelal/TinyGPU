module DataMem(
    input wire[15:0] ad,
    input wire we,
    input wire clk,
    input wire [15:0] wd,
    output reg [15:0] data

);
reg [15:0] ram [0:1023];
always @(posedge clk)
begin
if(we)
ram[ad]<=wd;
end
always @(*) begin
        data = ram[ad]; 
end

endmodule