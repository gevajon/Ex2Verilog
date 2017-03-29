`timescale 1ns/100ps
module Fibonachi
  (input reset, input clock, output reg [31:0]fibonachi);
  reg [31:0]dataA;
  reg [31:0]dataB;
  initial
    begin
  dataA=1;
  dataB=0;
    end
  
  always @(posedge clock)
    begin
      fibonachi=dataB+dataA;
      dataB=dataA;
      dataA=fibonachi;
      if(reset==0)
        begin
          dataA=1;
          dataB=0;
        end
    end
 
 endmodule
