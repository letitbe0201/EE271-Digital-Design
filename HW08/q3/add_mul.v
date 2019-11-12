module add_mul (A, B, C, D, clk, rst, out, state, nstate);
  input [7:0] A, B, C, D;
  input clk, rst;
  output reg [7:0] out;
  output reg [2:0] state, nstate;
  reg [7:0] w1, w2, w3;

  parameter s0 = 0; // Idling state
  parameter s1 = 1;
  parameter s2 = 2;
  parameter s3 = 3;

  always @ (posedge clk)
    begin
      if (rst == 0) state <= s0;
      else if (rst == 1) state <= nstate;
    end

  always @ (*)
    begin
      case (state)
	s0:
	  begin
	    nstate = s1;
	    out = 0;
	  end
	s1:
	  begin
	    nstate = s2;
	    w1 = A * B;
	    w2 = C * D;
	  end
	s2:
	  begin
	    nstate = s3;
	    w3 = w1 + w2;
	  end
	s3:
	  begin
	    nstate = s1;
	    out = w3;
	  end
      endcase
    end
endmodule
