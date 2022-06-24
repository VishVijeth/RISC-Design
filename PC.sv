module PC(input logic clk,rst, RegWrite, MemWrite,input logic[2:0] instruction_A,
			 output logic[31:0] prode_register_file, prode_data_memory,
			 output logic[6:0] register_file_segment, data_memory_segment);

logic[31:0] RD;
instruction_memory oof (clk,rst, instruction_A, RD);

logic[4:0] A3;
MUX_RegDst oof1 (RD[31], RD[15:11], RD[20:16], A3);

logic[31:0] RD1, RD2, WD3;
register_file oof2 (clk, rst, RegWrite, RD[25:21], RD[20:16], A3, WD3, RD1, RD2, prode_register_file);

logic[31:0] SignImm;
sign_extend oof3 (RD[15:0],SignImm); 

logic[31:0] SrcB;
MUX_ALUSrc oof4 (RD[30], SignImm, RD2, SrcB);

logic[31:0] ALUResult;
ALU oof5 (RD1, SrcB, RD[29:27] , ALUResult);

logic[31:0] RDD;
data_memory oof6 (clk,rst, MemWrite,  ALUResult, RD2, RDD, prode_data_memory);

MUX_MemtoReg oof7 (RD[26], ALUResult, RDD, WD3);

always_comb

case(prode_register_file)

	32'b0000: register_file_segment = 7'b100_0000;
	32'b0001: register_file_segment = 7'b111_1001;
	32'b0010: register_file_segment = 7'b010_0100;
	32'b0011: register_file_segment = 7'b011_0000;
	32'b0100: register_file_segment = 7'b001_1001;
	32'b0101: register_file_segment = 7'b001_0010;
	32'b0110: register_file_segment = 7'b000_0010;
	32'b0111: register_file_segment = 7'b111_1000;
	32'b1000: register_file_segment = 7'b000_0000;
	32'b1001: register_file_segment = 7'b001_1000;
	default:  register_file_segment = 7'b111_1111;

endcase
    
always_comb

case(prode_data_memory)

	32'b0000: data_memory_segment = 7'b100_0000;
	32'b0001: data_memory_segment = 7'b111_1001;
	32'b0010: data_memory_segment = 7'b010_0100;
	32'b0011: data_memory_segment = 7'b011_0000;
	32'b0100: data_memory_segment = 7'b001_1001;
	32'b0101: data_memory_segment = 7'b001_0010;
	32'b0110: data_memory_segment = 7'b000_0010;
	32'b0111: data_memory_segment = 7'b111_1000;
	32'b1000: data_memory_segment = 7'b000_0000;
	32'b1001: data_memory_segment = 7'b001_1000;
	default:  data_memory_segment = 7'b111_1111;

endcase

endmodule
