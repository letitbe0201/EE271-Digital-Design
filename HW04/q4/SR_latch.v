module SR_latch (q, qn, s, r);

  input s, r;
  output q, qn;
  wire q, qn;

  nor (q, r, qn);
  nor (qn, s, q);

  initial begin
    $monitor("s = %b r = %b  q = %b qn = %b  time = %0t", s, r, q, qn, $time);  end

endmodule
