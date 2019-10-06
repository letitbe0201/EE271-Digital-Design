module task_calling_tb();

  reg [7:0] tC;
  wire [7:0] tF;

  task_calling test(.DegC(tC), .DegF(tF));

  initial $monitor("'%b' = ((('%b' + 32) * 9) / 5) @ %0t", tF, tC, $time);

  initial begin: loop_input
    integer i;
    tC = 8'b00000000;

    for (i = 0; i < 30; i = i + 1)
      #10
      tC = tC + 1;      
  end

  initial begin
    $dumpfile("task_calling_tb.vcd");
    $dumpvars();
  end

endmodule
