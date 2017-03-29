
`timescale 1ns/100ps

module Register_tb;
  
  reg reset;
  reg clock;
  wire [31:0] fibonachi;
  
  
  Fibonachi fibo (reset,clock,fibonachi);
        initial
          begin
            reset=0;
            clock=0;
            $monitor($time,"reset=%b,clock=%b,fibonachi=%b",reset,clock,fibonachi);
          end
        initial
          begin
            #1 reset=1;
            #32 $finish;
          end
          always #1 clock=~clock;
  endmodule