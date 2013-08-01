module instruction_reg16 ( input [15:0] data_in,
									input clk, a_rst, ld_ir,
									output reg [15:0] data_out );
	always @ (posedge clk or posedge a_rst) begin
		if (a_rst) data_out = 4'h0000;
		else if (ld_ir) data_out = data_in;
	end
endmodule