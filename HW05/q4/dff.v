module dff (data, clk, reset, q);

  input data, clk, reset;
  output q;
  reg q;
  
  always @ (posedge clk) begin
    if (~reset) begin
      q <= 1'b0;
    end
    else begin
      q <= data;
    end
  end

endmodule
