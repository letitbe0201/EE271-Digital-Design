module q3 ();

  reg [3:0] a, b;
  integer i;

  initial begin
    $monitor("monitor  a:%h b:%h @ %0t", a, b, $time);
    for(i = 0; i < 4; i = i + 1) begin
      $strobe("strobe   a:%h b:%h @ %0t", a, b, $time);
      $display("display  a:%h b:%h @ %0t", a, b, $time);
      case(i)
        0 : a = 4;
	1 : b = 1;
	2 : begin end // Do nothing
	3 : {a, b} = 9;
      endcase
      $display("display  a:%h b:%h @ %0t", a, b, $time);
      #1;
    end
  end

endmodule

