module MUX_RegDst(input logic RegDst,input logic[4:0] input1, input2,
						output logic[4:0] out);

assign out = RegDst ? input1 : input2; 

endmodule
