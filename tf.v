// Code your design here
module traffic(
  input reset,
  input clk,
  output reg[2:0] highway,
  output reg[2:0] sideway);
  
  //light's values
  parameter RED=3'b100;
  parameter YELLOW=3'b010;
  parameter GREEN=3'b001;
 
  //For states
  parameter S0=2'b00; //highway green
  parameter S1=2'b01; //highway yellow
  parameter S2=2'b10; //sideway green
  parameter S3=2'b11; //sideway yellow
  
  reg[1:0] state;
  reg[3:0] counter;
  
  always @(posedge clk or posedge reset)
    begin
      if(reset)
        begin
      state <= S0;
      counter <= 0;
    end
  else
    begin
      case(state)S0:
        begin //higway's green
                          if (counter == 9) begin
                    state <= S1;
                    counter <= 0;
                end else
                    counter <= counter + 1;
            end

            S1: begin // Highway Yellow (3 sec)
                if (counter == 2) begin
                    state <= S2;
                    counter <= 0;
                end else
                    counter <= counter + 1;
            end

            S2: begin // Side Green (10 sec)
                if (counter == 9) begin
                    state <= S3;
                    counter <= 0;
                end else
                    counter <= counter + 1;
            end

            S3: begin // Side Yellow (3 sec)
                if (counter == 2) begin
                    state <= S0;
                    counter <= 0;
                end else
                    counter <= counter + 1;
            end

        endcase
    end
end

always @(*) begin
    case (state)
        S0: begin
            highway = GREEN;
            sideway    = RED;
        end

        S1: begin
            highway = YELLOW;
            sideway    = RED;
        end

        S2: begin
            highway = RED;
            sideway    = GREEN;
        end

        S3: begin
            highway = RED;
            sideway    = YELLOW;
        end
    endcase
end

endmodule
        
  
  