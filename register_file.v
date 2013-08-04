module register_file(  input [15:0] read_reg0, read_reg1, 
                      input load_r0, load_r1, clk, rst, swap,
                      output [15:0] reg0_out, reg1_out);
   
   
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			reg0_out <= 4'h0000;
			reg1_out <= 4'h0000;
		end
		else if (load_r0) 
			reg0_out <= read_reg0;
		else if (load_r1)
			reg1_out <= read_reg1;
		else if (swap) begin
			reg0_out <= read_reg1;
			reg1_out <= read_reg0;
		end
	end
	
endmodule
