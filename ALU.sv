module ALU(input logic[31:0] srcA, srcB, input logic[2:0] ALUControl,
			  output logic[31:0] ALUResult);

always_comb

case(ALUControl)

    3'b010: ALUResult = srcA + srcB;
    3'b110: ALUResult = srcA - srcB;
    default: ALUResult = 32'd0;
	 
endcase

endmodule
