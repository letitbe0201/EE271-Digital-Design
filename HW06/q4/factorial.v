module factorial();

  reg [ 3:0] num;
  reg [10:0] result;

  function automatic [10:0] f;
    input [3:0] num;
    begin
      if (num == 1)
        f = 1;
      else
        f = num * f(num - 1);
    end
  endfunction

  initial begin
    num = 6;
    result = f(num);
    #10;
    $display("\n\nFactorial of 6 is: %d\n\n", result);
  end

  initial begin
    $dumpfile("factorial.vcd");
    $dumpvars();
  end

endmodule
