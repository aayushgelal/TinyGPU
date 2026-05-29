module WarpScheduler(
  input wire clk,
  input wire reset,
  input wire [3:0] current_active,
  input wire [3:0] warp_stall,
  output reg [15:0] current_pc,
  output reg [1:0] active_warp_id,
  output reg valid_instruction
  
);

reg [15:0] pc_0, pc_1, pc_2, pc_3;
reg [1:0] current_turn;

always @(*) begin
    valid_instruction = 0;
    current_pc = 16'h0000;
    active_warp_id = current_turn;
    case(current_turn)
        2'b00: if(current_active[0] & ~warp_stall[0])begin
            current_pc=pc_0;
            valid_instruction=1;
        end
        2'b01: if(current_active[1] & ~warp_stall[1])begin
            current_pc=pc_1;
            valid_instruction=1;
        end
        2'b10: if(current_active[2] & ~warp_stall[2])begin
            current_pc=pc_2;
            valid_instruction=1;
        end
        2'b11: if(current_active[3] & ~warp_stall[3])begin
            current_pc=pc_3;
            valid_instruction=1;
        end
    endcase
end
always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc_0 <= 16'h0000;
            pc_1 <= 16'h0000;
            pc_2 <= 16'h0000;
            pc_3 <= 16'h0000;
            current_turn <= 2'b00;
        end else begin
            current_turn <= current_turn + 1;
            if(valid_instruction) begin
                case(active_warp_id)
                    2'b00: pc_0 <= pc_0 + 1;
                    2'b01: pc_1 <= pc_1 + 1;
                    2'b10: pc_2 <= pc_2 + 1;
                    2'b11: pc_3 <= pc_3 + 1;
                endcase
            end
            
            
        end
    end



endmodule