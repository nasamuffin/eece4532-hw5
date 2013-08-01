/*** 
 * left_right is left when high, right when low.
 */

module shiftreg16 ( input [15:0] parallel_in,
						  input clk, a_rst, shift_enable, load_enable, left_right,
						  output reg [15:0] parallel_out );
	always @ (posedge clk or posedge a_rst) begin
		if (a_rst) parallel_out = 4'h0000;
		else if (load_enable) begin
			parallel_out <= parallel_in;
		end
		else if (shift_enable) begin
			if (left_right) parallel_out <= parallel_out << 1;
			else parallel_out <= parallel_out >> 1;
		end
	end
endmodule