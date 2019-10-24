module stateMachine (clk, sign, signal);
  
  input [1:0] sign;
  input clk;
  output [3:0] signal;
  reg [3:0] signal;

  always @ (posedge clk)
    begin
      case(sign)
	2'b00:   signal = 4'b1000;
	2'b01:   signal = 4'b0100;
	2'b10:   signal = 4'b0010;
	2'b11:   signal = 4'b0001;
	default: signal = 4'b0000;
      endcase
    end

endmodule
