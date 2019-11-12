module mini_mux (A, B, sel, clk, rst, out);
  input A, B, sel, clk, rst;
  output reg out;
  reg w1_and, w2_or, w3_mux;

  always @ (*)
    begin
      w1_and = A && B;
      w2_or  = A || B;
      w3_mux = sel ? w2_or : w1_and;
    end

  always @ (posedge clk or rst)
    begin
      if (rst == 0) out <= 0;
      else out <= w3_mux;
    end

endmodule
