module stateMachine_tb();
  
  reg  [1:0] tsign;
  reg        tclk;
  wire [3:0] tsignal;

  stateMachine(.sign(tsign), .clk(tclk), .signal(tsignal));

  initial begin
    tsign = 2'b11;
    #5
    tsign = 2'b10;
    #5
    tsign = 2'b01;
    #5
    tsign = 2'b00;
    #5;
  end

  initial begin: clock_loop
    tclk = 0;
    forever begin
    #1 tclk = 1;
    #1 tclk = 0;
    end
  end

  initial begin
    $monitor("CLOCK: %b | SIGN: %b -> SIGNAL: %b | @ %0t", tclk, tsign, tsignal, $time);
    $dumpfile("stateMachine_tb.vcd");
    $dumpvars();
    #20 disable clock_loop;
    $finish;
  end

endmodule
