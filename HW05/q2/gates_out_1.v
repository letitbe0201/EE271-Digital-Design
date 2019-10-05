module gates_out_1 (A, B, D, E);

  input A, B, D;
  output E;

  wire C;

  assign C = A && B;
  assign E = C || D;

endmodule
