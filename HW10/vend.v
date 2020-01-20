module vend (clk, cancel, dime, quater, dollar, out_led, selectProduct, out_lcd, LED_button0, LED_button1, LED_button2, LED_button3, LED_button4, LED_button5);

  input clk, cancel, dime, quater, dollar;
  input [4:0] selectProduct;

  output reg out_led;           // Turn on when a product is delivered
  output reg [2:0] out_lcd;     // Display the amount of product
  output reg LED_button0, LED_button1, LED_button2, LED_button3, LED_button4, LED_button5;                                    // Show the selected product

  reg       state = 0, next_state;
  reg [9:0] collected = 0;      // Count the collected amount of money
  reg [4:0] select = 0;         // Store the value of selected product

  parameter S0 = 0;             // Idle state
  parameter S1 = 1;             // Inserting money after the user select a product
  parameter price_A = 10;       // 10 cent
  parameter A = 1;              // Number of product

  always @ (posedge clk or posedge cancel)
    begin
      if (cancel == 1) state <= S0;
      else        state <= next_state;
    end

  // Calculating amount of money
  always @ (dime or quater or dollar)
    begin
      if (dime)        collected = collected + 10;
      else if (quater) collected = collected + 25;
      else if (dollar) collected = collected + 100;
      else collected = collected;
    end

  always @ (*)
    begin
      case (state)
	S0:
	  begin
	    // Reset everything
	    out_led     = 0;
	    out_lcd     = 0;
	    LED_button0 = 0;
	    LED_button1 = 0;
	    LED_button2 = 0;
	    LED_button3 = 0;
	    LED_button4 = 0;
	    LED_button5 = 0;
	    next_state = S0;
	    collected   = 0;
	    select      = 0; 
	    if (selectProduct) select = selectProduct;
	    case (select)
	      1:
       		begin	      
	          next_state = S1;
		  LED_button1 = 1;
		end
	      default: next_state = S0;
	    endcase
	  end
	S1:
	  begin
	    if (collected >= price_A)
	      begin
		out_led = 1;
		collected = collected - price_A;
		out_lcd = out_lcd + 1;
		next_state = S1;
	      end
	    else next_state = S1;
	  end
	default: next_state = S0;
      endcase
    end

endmodule
