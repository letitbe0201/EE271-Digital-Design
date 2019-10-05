module gates_out_tb();

  reg tA, tB ,tD;
  wire tC1, tE1, tC2, tE2;

  gates_out_1 u1(.A(tA), .B(tB), .D(tD), .E(tE1));
  gates_out_2 u2(.A(tA), .B(tB), .D(tD), .E(tE2));

  initial begin

    $monitor("Monitor: [%h && %h] || %h = E1(%h) ; E2(%h) @ %0t", tA, tB, tD, tE1, tE2, $time);
    $display("----------------------------------------------------------");
    $display("E1: output from assign statement; E2: output from gatelevel modeling");
    #10
    tA = 0;
    tB = 0;
    tD = 0;
    #10
    tA = 0;
    tB = 0;
    tD = 1;
    #10
    tA = 0;
    tB = 1;
    tD = 0;
    #10
    tA = 0;
    tB = 1;
    tD = 1;
    #10
    tA = 1;
    tB = 0;
    tD = 0;
    #10
    tA = 1;
    tB = 0;
    tD = 1;
    #10
    tA = 1;
    tB = 1;
    tD = 0;
    #10
    tA = 1;
    tB = 1;
    tD = 1;
    #10
    $display("----------------------------------------------------------");
    $finish;
  
  end

endmodule
