module function_call();

  reg [7:0] a, b;

  function [7:0] cube;
    input [7:0] a;
    begin
      cube = a * a * a;
    end
  endfunction
  
  initial begin
    a = 3;
    b = cube(a);
    #10;
    $display("\n\nNumber is:%d and the Cube is:%d\n\n", a, b);
  end

  initial begin
    $dumpfile("function_call.vcd");
    $dumpvars();
  end

endmodule
