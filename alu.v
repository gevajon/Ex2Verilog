`timescale 1ns/100ps

module ALU(in1, in2, imm, sh, ALUop, result);
  
  input signed [31:0] in1,in2;
  input signed [15:0] imm;
  input [4:0] sh, ALUop;
  output [31:0] result;
  
  parameter ADDI = 4'b0000,//0
  			ADD = 4'b0001,//1
  			SUB = 4'b0010,//2
  			OR = 4'b0011,//3
  			ORI = 4'b0100,//4
  			SHL = 4'b0101,//5
  			SHR = 4'b0110,//6
  			SRA = 4'b0111;//7
  assign
    result=
    (ALUop==ADDI)?(in1+{{16{imm[15]}},imm}):
    (ALUop==ADD)?(in1+in2):
    (ALUop==SUB)?(in1-in2):
    (ALUop==OR)?($unsigned(in1|in2)):
    (ALUop==ORI)?($unsigned(in1|imm)):
    (ALUop==SHL)?($unsigned (in2<< sh)):
    (ALUop==SHR)?($unsigned (in2>> sh)):
     (ALUop==SRA)?($unsigned(in1>>>sh)):32'b0;
endmodule
                  



