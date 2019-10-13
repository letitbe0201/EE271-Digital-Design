module ram6116 (IO, Cs_b, We_b, Oe_b, Address);

  inout [7 : 0] IO;
  input [7 : 0] Address;
  input         Cs_b, We_b, Oe_b;

  reg   [7 : 0] RAM1[0 : 255];
  

  // test
  integer i;
  integer n = 32;
  initial begin
    for (i = 0; i < n; i = i + 1)
      RAM1[i] = i;
  end
	  

  // Output data to IO bus, otherwise block the IO with zzzzzz
  // Tristate buffer for the memory
  assign IO = (Cs_b == 1'b1 | We_b == 1'b0 | Oe_b == 1'b1) ? 8'bZZZZZZZZ : RAM1[Address];

  // Write to RAM from IO bus
  always @(We_b, Cs_b)
    begin
      @(negedge We_b) // Falling edge of writing enable
        if (Cs_b == 1'b0)
          begin
	    RAM1[Address] <= IO;  // Pass data from the IO bus to the memory
	  end
    end

endmodule
