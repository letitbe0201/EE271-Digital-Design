module NRZ2Man_tb();
  wire tout;
  wire [1:0] tstate, tnstate;
  reg  tin, tclk, treset;

  NRZ2Man test(.out(tout), .in(tin), .clk(tclk), .reset(treset), .state(tstate), .nstate(tnstate));

  initial begin
    treset = 0;
    //tin = 0;
    #25
    treset = 1;
    tin = 0;
    #20
    tin = 1;
    #60
    tin = 0;
    #40
    tin = 1;
    #20
    tin = 0;
    #20
    treset = 0;
    #10
    tin = 1;
    #20
    tin = 0;
    treset = 1;
    #20
    tin = 1;
  end

  initial begin: clock_loop
    tclk = 1;
    forever begin
      #5 tclk = 0;
      #5 tclk = 1;
    end
  end

  initial begin
    //$monitor("CLK: %b RST: %b | IN: %b OUT: %b | cs: %d ns: %d | @ %0t", tclk, treset, tin, tout, tstate, tnstate, $time);
    $dumpfile("NRZ2Man_tb.vcd");
    $dumpvars();
    #300 disable clock_loop;
    $finish;
  end
endmodule
