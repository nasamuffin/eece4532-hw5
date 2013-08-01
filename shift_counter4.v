/***
 * Counter for shift register ranges from 0-15 bits.
 * Shift larger than 15 bits will result in 0 anyway do not support
 * Provide a zero flag output instead of actual counter value since that's
 * all we care about.
 */

module shift_counter4 ( input [3:0] data_in,
								input clk, a_rst, decr_enable,
								output reg zero );
	reg [3:0] count;
	
	always @ (posedge clk or posedge a_rst) begin
		if (a_rst) count = 1'h0;
		else if (decr_enable) count = count - 1;
	end
	
	always @ (count) if (count == 1'h0) zero = 1;
endmodule