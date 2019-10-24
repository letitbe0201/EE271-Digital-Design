module buffer_tb();

  reg tclk, tdata;
  wire tout;
  // Parameter for generating input using a binary array of decimal number
  parameter [5:0] input_gen = 41;
  integer i;

  buffer test(.clk(tclk), .data(tdata), .out(tout));

  initial begin: clock_loop
    tclk = 0;
    forever begin
      #1 tclk = 1;
      #1 tclk = 0;
    end
  end

  initial begin
    // Sequencially assign input to data
    for (i=0; i<6; i=i+1)
      #3 tdata = input_gen[i];
    tdata = 1'bz;
  end

  initial begin
    $monitor("clk: %b, data: %b, out: %b  @ %0t", tclk, tdata, tout, $time);
    $dumpfile("buffer.vcd");
    $dumpvars();
    #30 disable clock_loop;
    $finish;
  end

endmodule
