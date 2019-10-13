module ram6116_system ();

  wire [7:0] IO;
  reg  [1:0] state;
  reg  [1:0] next_state;
  reg  [7:0] Data;
  reg  [7:0] Address;
  reg        inc_adrs;    // Siganl address increase
  reg        inc_data;    // Signal data increase
  reg        ld_data;     // Load data to data register
  reg        en_data;     // Enable output of data register (to bus and memory)
  reg        Cs_b;        // Chip Select, when low the memory are available to read and write
  reg        We_b;        // Write enable, when low write data into the memory 
  reg        Oe_b;        // Ouput enable, when low output the memory data to the bus
  reg        clk;
  reg        done;        // Signal when read write is done


  // Initialize all controlling signal
  initial begin
    state    = 0;
    Address  = 8'b00000000;  // Address register
    inc_adrs = 1'b0;
    inc_data = 1'b0;
    ld_data  = 1'b0;
    en_data  = 1'b0;
    Cs_b     = 1'b0;         // initialize to read mode (Bus read from memory)
    We_b     = 1'b1;
    Oe_b     = 1'b0;
    clk      = 1'b0;
    done     = 1'b0;
  end


  // Configure the Ram6116
  ram6116 RAM1 (.IO(IO), .Address(Address), .Cs_b(Cs_b), .We_b(We_b), .Oe_b(Oe_b));


  // State machine for read and write from the memory
  always @(state or Address)
    begin : state_control     // Configure the initial condition every time the state or address change 
      inc_adrs = 1'b0;
      inc_data = 1'b0;
      ld_data  = 1'b0;
      en_data  = 1'b0;
      Cs_b     = 1'b0;
      Oe_b     = 1'b1;
      We_b     = 1'b1;

      case (state)
        0:
	  begin                 // Data flow from memory to the bus to the register
	    Oe_b       = 1'b0;
	    ld_data    = 1'b1;
	    next_state = 1;
	  end
        1:
          begin
	    inc_data   = 1'b1;
	    next_state = 2;
	  end
        2:
          begin                 // Data flow back from register to the bus to the memory
	    We_b       = 1'b0;
	    en_data    = 1'b1;
	    inc_adrs   = 1'b1;
	    next_state = 3;
	  end
        3:
	  begin
	    if (Address == 8'b00100000)  // Check if finish all the read/write
	      begin
		done       = 1'b1;
		next_state = 3;
              end
	    else
	      begin
		next_state = 0;
	      end
	  end
      endcase	  
    end

  
  // Always block with clock cycle to update data register
  always @(posedge clk)
    begin : register_update
      state <= next_state;
      if (inc_data == 1'b1)
	begin
	  Data <= Data + 1;
        end
      if (ld_data == 1'b1)
        begin
	  Data = IO;                // Pass data from the IO bus to the data register
        end
      if (inc_adrs == 1'b1)
        begin
	  Address <=  Address + 1;  // Delay added to allow completion of memory write
	end
    end


  // Concurrent statements
  always #100 clk = ~clk;
  // Tristate buffer for the data register
  assign IO = (en_data == 1'b1) ? Data : 8'bZZZZZZZZ;
  

  initial begin
    $dumpfile("ram6116_system.vcd");
    $dumpvars();
    $monitor("Data: %b, Address: %b, %0t", Data, Address, $time);
    #30000 $finish;
  end

endmodule
