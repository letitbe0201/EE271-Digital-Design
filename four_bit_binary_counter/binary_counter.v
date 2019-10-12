module binary_counter (count, enable, clk, rst);

  parameter             size = 4;
  output [size - 1 : 0] count;
  input                 enable, clk, rst;
  wire                  enable_DP;
  
  // Control unit for controlling the data flow; Datapath unit for calculating
  // the data
  control_unit  c (enable_DP, enable, clk, rst);
  datapath_unit d (count, enable_DP, clk, rst);

endmodule


module control_unit (enable_DP, enable, clk, rst);

  output enable_DP;
  input enable, clk, rst;

  // Pass through the enable signal
  wire enable_DP = enable;

endmodule


module datapath_unit (count, enable_DP, clk, rst);

  parameter             size = 4;
  output [size - 1 : 0] count;
  reg    [size - 1 : 0] count;
  input                 enable_DP, clk, rst;
  //wire   [size - 1 : 0] next_count;
  
  // Reset the counter when rst is 1, else keep counting while the enable is 1
  always @ (posedge clk)
    if (rst == 1)
      count <= 0;
    else if (enable_DP == 1)
      count <= next_count(count);

  function [size - 1 : 0] next_count;
    input [size - 1 : 0] count;
    begin
      next_count = count + 1;
    end
  endfunction

endmodule
