module Add_half_tb();

  wire c_out, sum;
  reg a, b;

  Add_half u(.sum(sum), .c_out(c_out), .a(a), .b(b));
	
  initial begin
    #2
    a = 0;
    b = 0;
    #2
    a = 0;
    b = 1;
    #2
    a = 1;
    b = 0;
    #2
    a = 1;
    b = 1;
    #2
    ;
  end

endmodule
