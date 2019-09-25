module top();

  reg tin, tclk, trst;
  wire tout;

  mdff u(.min(tin), .mclk(tclk), .mrst(trst), .mout(tout));

endmodule
