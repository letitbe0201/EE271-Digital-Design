module NRZ2Man (out, in, clk, reset, state, nstate);
  output reg out;
  input      in;
  input      clk, reset;
  output reg [1:0]  state, nstate;

  parameter       s0 = 0;
  parameter       s1 = 1;
  parameter       s2 = 2;
  parameter       s3 = 3;           // Idle state
  parameter dc_state = 2'bx;
  parameter   dc_out = 1'bx;

  always @ (negedge clk or negedge reset)
    begin
      if (reset == 0) state <= s3;  // Idle state
      else            state <= nstate;
    end

  always @ (*)
    begin
      out = 0;
      case(state)
	s3:    //Idle state
          begin
	    nstate = s0;
	    out = 1'bx;
	  end
	s0:
	  begin
	    if (in == 0)
	      begin
	        nstate = s1;
	      end
	    else if (in == 1) 
	      begin
		nstate = s2;
		out    = 1;
	      end
	  end
  	s1:
	  begin
	    nstate = s0;
	    out    = 1;
	  end
	s2:
	  begin
	    nstate = s0;
	  end
	default:
	  begin
	    nstate = dc_state;
	    out    = dc_out;
	  end
      endcase
    end
endmodule
