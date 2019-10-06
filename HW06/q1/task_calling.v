module task_calling(DegC, DegF);

  input [7:0] DegC;
  output [7:0] DegF;

  reg [7:0] DegF;

  task convert;
    input [7:0] C;
    output [7:0] F;
    begin
      F = (((C + 32) * 9) / 5);
    end
  endtask

  always @ (DegC)
  begin
    convert (DegC, DegF);
  end

endmodule
