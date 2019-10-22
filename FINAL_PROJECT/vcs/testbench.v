module ee271_final_proj_vendingmachine_tb();
  reg        clk, confirm, cancel;
  reg  [2:0] coin;
  reg  [2:0] item_sel;
  reg  [1:0] amt_sel;
  wire [1:0] a_amt, b_amt, c_amt, d_amt, e_amt;
  wire [5:0] a_chg, b_chg, c_chg, d_chg, e_chg;
  wire [2:0] item_name;
  wire [1:0] item_amt;
  wire [5:0] change;
  wire [2:0] state, next_state;

  ee271_final_proj_vendingmachine test(clk, confirm, cancel, coin, item_sel, amt_sel, a_amt, b_amt, c_amt, d_amt, e_amt, a_chg, b_chg, c_chg, d_chg, e_chg, item_name, item_amt, change, state, next_state);
  
  initial begin
    $monitor("c_amt: %b, State: %b, Item: %b, Amount: %b, Change: %d @ %0t", c_amt, state, item_name, item_amt, change, $time);
    $dumpfile("ee271_final_proj_vendingmachine.vcd");
    $dumpvars();
    #200 disable clock_loop;
    $finish;
  end

  initial begin: clock_loop
    clk = 0;
    forever begin
      #1 clk = 1;
      #1 clk = 0;
    end
  end

  initial begin
    #5 item_sel = 3'b011;
    #3 amt_sel = 2'b11;
    //#2 coin = 3'b100;
    #6 coin = 3'b010;
    #1 coin = 3'b001;
    #2 coin = 3'b010;
    #100 cancel = 1;
    #2 cancel = 0;
  end

endmodule
