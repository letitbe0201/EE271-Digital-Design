module aridecode_tb();
  
  reg [2:0] topcode;
  reg [1:0] tda, tdb;
  reg tenable;
  wire [1:0] tout;
  integer i, j, k;

  aridecode test(.opcode(topcode), .da(tda), .db(tdb), .enable(tenable), .out(tout));

  initial begin
    // Generate every single da, db and opcode using three for loops
    for (i=0; i<4; i=i+1)
      begin
	for (j=0; j<4; j=j+1)
	  begin	    
	    for (k=0; k<8; k=k+1)
	      begin
		tda = i;
	    	tdb = j;
		topcode = k;
	    	tenable = 0;
		#1
		tenable = 1;
		#1;
	      end
	  end
      end
  end
  
  initial begin
    $monitor("EN: %b | da: %b, db: %b | opcode: %b | OUT: %b | @ %0t", tenable, tda, tdb, topcode, tout, $time);
    $dumpfile("aridecode_tb.vcd");
    $dumpvars();
    #270
    $finish;
  end
  
endmodule
