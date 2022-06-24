module instruction_memory(input logic clk, rst, input logic[2:0] A,
								  output logic[31:0] RD);

reg[31:0] ins_regs[4:0];

always@(posedge clk or negedge rst) begin

    if(!rst) begin
    
        ins_regs[0] <= 0; // 0
        
        ins_regs[1] <= 32'b010101_00010_00001_0000_0000_0000_0011; // Load 
        
        ins_regs[2] <= 32'b010100_01000_00001_0000_0000_0000_0001; // Store
        
        ins_regs[3] <= 32'b100100_00011_00100_00001_00000_000000;// Add
        
        ins_regs[4] <= 32'b101100_01010_01000_00001_00000_000000; // Subtract
        
    end
    
    else begin
	 
        RD<= ins_regs[A];
		  
    end
    
end
endmodule


        
