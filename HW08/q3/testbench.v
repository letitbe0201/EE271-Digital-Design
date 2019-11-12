module add_mul_tb();
  reg [7:0] tA, tB, tC, tD;
  reg tclk, trst;
  wire [7:0] tout;
  wire [2:0] tstate, tnstate;

  add_mul test(.A(tA), .B(tB), .C(tC), .D(tD), .clk(tclk), .rst(trst), .out(tout), .state(tstate), .nstate(tnstate));

  initial begin
    trst = 0;
    #5
    trst = 1;
    tA = 1;
    tB = 2;
    tC = 3;
    tD = 4;
    #20
    tA = 5;
    tB = 6;
    tC = 7;
    tD = 8;
    #20
    tA = 9;
    tB = 1;
    tC = 2;
    tD = 3;
    #20
    trst = 0;
  end
  
  initial begin: clock_loop
    tclk = 0;
    forever begin
      #1 tclk = 1;
      #1 tclk = 0;
    end
  end

  initial begin
    $monitor();
    $dumpfile("add_mul_tb.vcd");
    $dumpvars();
    #80 disable clock_loop;
    $finish;
  end
endmodule
