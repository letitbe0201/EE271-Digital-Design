module Add_half(sum, c_out, a, b);

  input a, b;
  output sum, c_out;

  xor M(sum, a, b);
  and N(c_out, a, b);

endmodule

module Add_full();

  reg a, b, c_in;
  wire sum, c_out;
  wire w1, w2, w3;
  integer i;

  Add_half M1(w1, w2, a , b);
  Add_half M2(sum, w3, c_in, w1);
  or (c_out, w2, w3);

  initial begin
    $monitor("a: %b b: %b c_in: %b sum: %b c_out: %b @ %0t", a, b, c_in, sum, c_out, $time);
    for (i = 0; i < 8; i = i + 1)
    begin
      {a, b, c_in} = i;
      #10;
    end
  end

  initial begin
    $dumpfile("Add.vcd");
    $dumpvars();
  end

endmodule
