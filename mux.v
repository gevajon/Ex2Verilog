module Mux#(parameter NUM_LEVELS = 5, WIDTH = 2**(NUM_LEVELS-1))(in, sel, out);
input [WIDTH-1:0] in;
input [NUM_LEVELS-2:0] sel;
output out;
wire temp;
genvar i,j;

generate
for(i = 0 ; i < NUM_LEVELS-1 ; i++)
  begin: gen_levels
    for(j = 0; j <= ((2**(NUM_LEVELS-1-i))-1) ;j = j+2)
    begin: gen_nodes

      wire in_lows;
      wire in_high;
      wire out_int;
      if (i == 0)
        begin
          assign in_lows = in[j];
          assign in_high = in[j+1];
        end
      else
        begin
          assign in_lows = gen_levels[i-1].gen_nodes[j].out_int;
          assign in_high = gen_levels[i-1].gen_nodes[j+2].out_int;
        end
      assign out_int = (sel[i])? in_high:in_lows;
      if (i==NUM_LEVELS-2)
      	assign temp = out_int;
    end
  end 
endgenerate
assign out = temp;
endmodule
