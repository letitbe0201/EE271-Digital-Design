module gates_out_2 (A, B, D, E);

  input A, B, D;
  output E;

  wire C;

  and(C, A, B);
  or(E, C, D);

endmodule
