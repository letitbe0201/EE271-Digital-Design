module task_example();

  reg [7:0] r_Mux_Addr_Data = 0;
  reg       r_Addr_Valid = 1'b0;
  reg       r_Data_Valid = 1'b0;

  task do_write;
    input [7:0] i_addr, i_data;
    begin
      r_Addr_Valid    = 1'b1;
      r_Mux_Addr_Data = i_addr;
      #10;
      r_Addr_Valid    = 1'b0;
      r_Data_Valid    = 1'b1;
      r_Mux_Addr_Data = i_data;
      #10;
      r_Data_Valid    = 1'b0;
      #10;
    end
  endtask

  initial begin
    #10;
    do_write(8'h00, 8'hAB);
    do_write(8'h01, 8'hBC);
    do_write(8'h02, 8'hCD);
  end

  initial begin
    $dumpfile("task_example.vcd");
    $dumpvars();
  end

endmodule
