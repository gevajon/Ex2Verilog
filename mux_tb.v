module Mux_tb;
reg [15:0]in;
reg [3:0]sel;
wire out;

Mux test_b (in,sel,out);
initial
  begin
$dumpfile ("dump.vcd");
    $dumpvars (1);
    $monitor ("in= %b, sel= %b, out =%b",in,sel,out);
   in = 0; sel = 0; 
#1 in = 16'b1111110000011111; sel = 4'b1000;
#1 in = 16'b1111111111110111; sel = 4'b0011;
#1 in = 16'b0001000000000000; sel = 4'b1100;
#1 $finish;
  end
endmodule