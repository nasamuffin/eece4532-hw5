module counter ( input [15:0] in,
            input clk, rst, enable,
            output reg [15:0] out);

  initial begin
    out = 16'h0001;
  end
    
  always @ (posedge clk)
      out = !rst && enable ? in : 16'h0001;

endmodule