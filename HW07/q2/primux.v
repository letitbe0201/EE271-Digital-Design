module primux (y, a, b, c, d, sa, sb, sc);

  output y;
  // Control signal sa, sb, sc
  input a, b, c, d, sa, sb, sc;
  reg y;

  always @ (sa or sb or sc or a or b or c or d)
    begin
      if (sa == 1)
	y = a;
      else if (sb == 0)
	y = b;
      else if (sc == 1)
	y = c;
      else
	y = d;
    end

endmodule
