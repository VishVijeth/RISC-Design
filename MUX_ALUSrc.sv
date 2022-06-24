module MUX_ALUSrc(input logic ALUSrc,input logic[31:0] SignImm, RD2,
						output logic[31:0] SrcB);

assign SrcB = ALUSrc ? SignImm : RD2; 

endmodule
