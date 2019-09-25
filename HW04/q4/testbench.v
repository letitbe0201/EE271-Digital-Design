module SR_latch_tb();

  wire q, qn;
  reg s, r;

  SR_latch u(.q(q), .qn(qn), .s(s), .r(r));

  initial begin
    #10
    s = 0;
    r = 0;
    #10
    s = 0;
    r = 1;
    #10
    s = 1;
    r = 0;
    #10
    s = 1;
    r = 1;
    #10
    s = 0;
    r = 0;
    #10;
  end

endmodule
