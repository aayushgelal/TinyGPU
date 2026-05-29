
module reg_file(
    input clk,
    input reset,
    input we,
    input wire [3,0] a1,
    input wire [3,0] a2,
    input wire [3,0] a3,
    input wire [15:0] wd,
    input wire [15:0] block_idx,
    input wire [15:0] block_dim,
    input wire [15:0] thread_idx,
    output reg [15:0] rs1,
    output reg [15:0] rs2,

   


);

reg [15:0] register [0:15],
integer i

always @(posedge clk or posedge reset) begin
    if(reset) begin
        for(i=0;i<13;i=i+1) begin
            register[i]<=16'h0000;
        end
        register[13]<=block_dim;
        register[14]<=block_idx;
        register[15]<=thread_idx;
    end
    else if(we & a3 < 4'd13) begin
        register[a3]<=wd;
    end
end

always @(*)
begin
    rs1=register[a1];
    rs2=register[a2];
end

endmodule