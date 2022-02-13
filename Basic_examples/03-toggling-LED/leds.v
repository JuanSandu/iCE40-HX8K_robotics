// Toggle LEDs each one second.

module top( input clk,
            output wire LED0,
            output wire LED1,
            output wire LED2,
            output wire LED3,
            output wire LED4,
            output wire LED5,
            output wire LED6,
            output wire LED7 );

   reg [7:0] led_reg;
   reg [24:0] counter;

   assign LED0 = ~led_reg[0];
   assign LED1 = ~led_reg[1];
   assign LED2 = ~led_reg[2];
   assign LED3 = ~led_reg[3];
   assign LED4 = ~led_reg[4];
   assign LED5 = ~led_reg[5];
   assign LED6 = ~led_reg[6];
   assign LED7 = 1'b0;

   initial begin
     led_reg[6:0] = 128; // Every bit to 1 expressed in decimal
     counter = 0;
   end

   always @(posedge clk)
   begin
      counter <= counter + 1;
      if (counter == 12000000) begin
        led_reg[7:0] <= ~led_reg[7:0];
        counter <= 0;
      end
   end

endmodule // top
