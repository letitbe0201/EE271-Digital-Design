module mini_mux_tb();
  reg tA, tB, tsel, tclk, trst;
  wire tout;
  parameter in_gen = 16;
  integer i;

  mini_mux test(.A(tA), .B(tB), .sel(tsel), .clk(tclk), .rst(trst), .out(tout));

  initial begin
    for (i = 0; i < in_gen; i = i+1)
      begin
        #5 {tA, tB, tsel, trst} = i;
      end
  end

  initial begin: clock_loop
    tclk = 0;
    forever begin
      #1 tclk = 1;
      #1 tclk = 0;
    end
  end

  initial begin
    $monitor("CLK: %b | RST: %b | SEL: %b | A: %b B: %b | OUT: %b | @ %0t", tclk, trst, tsel, tA, tB, tout, $time);
    $dumpfile("mini_mux_tb.vcd");
    $dumpvars();
    #100 disable clock_loop;
    $finish;
  end
endmodule
