module lfsr_4 ( input wire clk_in, input wire rst_in,
                    input wire [15:0] seed_in,
                    output logic [15:0] q_out);
  logic xor_15;
  logic xor_2;
  logic [15:0] q_out_buffer;
  
  assign q_out = q_out_buffer;
  assign xor_15 = q_out_buffer[14] ^ q_out_buffer[15];
  assign xor_2 = q_out_bufffer[1] ^ q_out_buffer[15];
  
  always_ff @(posedge clk_in)begin
    if(rst_in)begin
      q_out_buffer <= seed_in;
    end
    else begin
      for(integer i = 0;i<16;i+=1)begin
        if(i == 0)begin
          q_out_buffer[0] <= q_out_buffer[15];
        end else if(i == 2)begin
          q_out_buffer[2] <= xor_2;
        end else if(i == 15)begin
          q_out_buffer[15]<= xor_15;
        end else begin
          q_out_buffer[i] <= q_out_buffer[i-1];
        end
      end
    end
  end

endmodule
