module block_nonblock();

  reg a, b, c, d, e, f;

  // Blocking assignments
  initial begin
    a = #10 1'b1;
    b = #20 1'b0;
    c = #40 1'b1;
  end

  // Nonblocking assignments
  initial begin
    d <= #10 1'b1;
    e <= #20 1'b0;
    f <= #40 1'b1;
  end

  initial begin
    $dumpfile("Test.vcd");
    $dumpvars();
  end

endmodule
