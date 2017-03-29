

`timescale 1ns/100ps

module ALU_tb;
  
  reg [31:0] in1;
  reg [31:0] in2;
  reg [15:0] imm;
  reg [4:0] sh;
  reg [4:0] ALUop;
  wire [31:0]result;
  
  
  ALU alu (in1,in2,imm,sh,ALUop,result);
        initial
          begin
           in1=0;
           in2=0;
           imm=0;
           sh=0;
           ALUop=0;
            $monitor($time,"in1=%b,in2=%b,imm=%b,sh=%b,ALUop=%b,result=%b",in1,in2,imm,sh,ALUop,result);
          end
        initial
          begin
            #1 in1=1;
            #1 in2=1;
            #1 ALUop=0;
            #1 ALUop=1;
            #1 ALUop=2; 
            #1 ALUop=3;
            #1 ALUop=4;
            #1 ALUop=5;
            #1 ALUop=6;
            #1 ALUop=7;
            #1 ALUop=8;
           
          end
  
  endmodule