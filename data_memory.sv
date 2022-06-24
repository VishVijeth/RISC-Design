module data_memory(input logic clk, rst, WE,input logic[31:0] A, WD,
						 output logic[31:0] RD, prode);

reg[31:0] registers[31:0];
always@(posedge clk or negedge rst)
begin
    if(!rst) begin
        for(int i = 0; i < 32; i++) begin
            registers[i] <= i;
        end
    end
    
    else begin
       
          if (WE) begin
				registers[A] <= WD;
          end
          
    end

end

assign RD = registers[A];
assign prode = registers[A];

endmodule
