module primux_tb();

  reg ta, tb, tc, td, tsa, tsb, tsc;
  wire ty;
  parameter [9:0] input_gen1 = 123;
  parameter [9:0] input_gen2 = 456;
  parameter [9:0] input_gen3 = 789;
  integer i;

  primux test(.a(ta), .b(tb), .c(tc), .d(td), .sa(tsa), .sb(tsb), .sc(tsc), .y(ty));

  initial begin
    ta = 1;
    tb = 0;
    tc = 1;
    td = 0;

    for (i=0; i<10; i = i+1)
      begin
	#8
	tsa = input_gen1[i];
	tsb = input_gen2[i];
	tsc = input_gen3[i];
      end
  end

  initial begin
    $monitor("a: %b, b: %b, c: %b, d: %b, sa: %b, sb: %b, sc: %b  ->  y: %b @ %0t", ta, tb, tc, td, tsa, tsb, tsc, ty, $time);
    $dumpfile("primux_tb.vcd");
    $dumpvars();
    #100
    $finish;
  end

endmodule
