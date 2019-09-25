module SR_latch (q, qn, s, r);

  input s, r;
  output q, qn;
  wire q_, qn_;

  nand (q_, s, qn);
  nand (qn_, r, q);
  assign #1 q = q_;
  assign #1 qn = qn_;

  initial begin
    $monitor("s = %b r = %b  q = %b qn = %b  time = %0t", s, r, q, qn, $time);  end

endmodule
