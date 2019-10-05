module testbench();

  reg tclk, treset;
  reg tdata;
  wire tq;

  dff test(.data(tdata), .clk(tclk), .reset(treset), .q(tq));

  initial begin: clock_loop
    tclk = 0;
    forever begin
      #10 tclk = 1;
      #10 tclk = 0;
    end
  end

  initial begin
    #15
    tdata = 0;
    #15
    tdata = 1;
    #15
    tdata = 0;
    #15
    tdata = 1;
    #15
    tdata = 0;
    #15
    tdata = 1;
    #15
    tdata = 0;
    #15
    tdata = 1;
    #15
    tdata = 0;
    #15
    tdata = 1;
    #15
    tdata = 0;
    #15
    tdata = 1;
  end

  initial begin
    treset = 1;
    #60
    treset = 0;
    #60
    treset = 1;
  end

  initial begin
    $monitor("clk = %b    reset = %b    data = %b    q = %b    @ %0t", tclk, treset, tdata, tq, $time);
  end

  initial begin
    #200 disable clock_loop;
    $finish;
  end

endmodule
  
