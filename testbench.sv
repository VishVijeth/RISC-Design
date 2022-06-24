module testbench();

logic clk,rst, RegWrite, MemWrite;
logic[2:0] instruction_A;
logic[31:0] prode_register_file, prode_data_memory;

PC atlast (clk, rst, RegWrite, MemWrite, instruction_A, prode_register_file, prode_data_memory);

initial begin
    clk=0;
    forever begin
    #10; clk=~clk; 
    end 
end

initial begin
	rst = 0; #100;
	rst = 1; #200;
end

initial begin
		
	MemWrite = 0;
	RegWrite = 0;
	instruction_A = 3'd0;#200;
	
	MemWrite = 0;
	RegWrite = 1;
	instruction_A = 3'd1;#200;
	
	MemWrite = 1;
	RegWrite = 0;
	instruction_A = 3'd2;#200;
	
	MemWrite = 0;
	RegWrite = 1;
	instruction_A = 3'd3;#200;

	instruction_A = 3'd4;#200;
	
end 
endmodule 