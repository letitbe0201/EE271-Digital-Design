module binary_counter_tb();

  parameter           size = 4;
  wire [size - 1 : 0] tcount;
  reg                 tenable, tclk, trst;

  binary_counter test(.count(tcount), .enable(tenable), .clk(tclk), .rst(trst));  
  initial begin: clock_loop
    tclk = 0;
    forever begin
      #10 tclk = 1;
      #10 tclk = 0;
    end
  end

  initial begin
    tenable = 0;
    trst = 0;
    #10
    trst = 1;
    tenable = 1;
    #10
    trst = 0;
    #60
    trst = 1;
    #20
    trst = 0;
    #60
    tenable = 0;
    #20
    trst = 1;
    #40
    trst = 0;
    tenable = 1;
  end

  initial begin
    $monitor("enable = %b, rst = %b, clk = %b, count = %b @ %0t", tenable, trst, tclk, tcount, $time);
    #401 disable clock_loop;
    $finish;
  end

endmodule
