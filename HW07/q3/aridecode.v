module aridecode (out, da, db, enable, opcode);

  input  [2:0] opcode;
  input  [1:0] da, db;
  input        enable;
  output [1:0] out;

  reg    [1:0] w1;
  
  // Enable = 0, let output be high impedence
  assign out = (enable == 1) ? w1 : 2'bz;

  always @ (opcode or da or db)
    begin
      case (opcode)
	3'b001:  w1 = da | db;
	3'b010:  w1 = da ^ db;
	3'b110:  w1 = ~db;
	default: w1 = 2'b0;
      endcase
    end

endmodule
