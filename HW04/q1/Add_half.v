module Add_half (sum, c_out, a, b);

  input a, b;
  output c_out, sum;
  wire sum, c_out;
  wire a, b;
 
  xor (sum, a, b);
  and (c_out, a, b);
  
  initial begin
    $monitor("a = %b b = %b  sum = %b c_out = %b time.= %0t", a, b, sum, c_out, $time);
  end

endmodule
