module vend_TB();
  reg clk, cancel, dime, quater, dollar;
  reg [4:0] selectProduct;
  
  wire out_led;
  wire [2:0] out_lcd;
  wire LED_button0, LED_button1, LED_button2, LED_button3, LED_button4, LED_button5;

  vend v(.clk(clk), .cancel(cancel), .dime(dime), .quater(quater), .dollar(dollar), .out_led(out_led), .selectProduct(selectProduct), .out_lcd(out_lcd), .LED_button0(LED_button0), .LED_button1(LED_button1), .LED_button2(LED_button2), .LED_button3(LED_button3), .LED_button4(LED_button4), .LED_button5(LED_button5));

  always #1 clk = ~clk;

  initial begin
    clk = 0;
    #10
    selectProduct = 5'b00001;
    #10
    dime = 1'b1; #2
    dime = 1'b0;
    #10
    quater = 1'b1; #2
    quater = 1'b0;
    #10
    dime = 1'b1; #2
    dime = 1'b0;
    #10
    dime = 1'b1; #2
    dime = 1'b0;
    #500
    $finish;
  end

  initial begin
    $monitor("out_led: %b | out_lcd: %d | LED1: %b | @ %0t", out_led, out_lcd, LED_button1, $time);
    $dumpfile("vend.vcd");
    $dumpvars();
  end
endmodule
