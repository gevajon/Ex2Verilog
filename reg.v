`timescale 1ns/100ps
module Register
  (input [31:0] write, input [4:0] line, input clock, output [31:0] read);
  reg [31:0] memory[31:0];
  
  always @(posedge clock)
    begin
  memory[line]=write;
    end
  assign read=memory[line];
 
 endmodule