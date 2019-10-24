module buffer (clk, data, out);

  input clk, data;
  output out;
  reg out;

  always @ (posedge clk)
    out <= data;

endmodule
