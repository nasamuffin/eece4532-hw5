// Neel Shah and Emily Shaffer

module alu (  input [15:0] A, B, C,
              input [5:0] operation,            
              output reg [15:0] ALUresult,
              output Zero,
			  output Negative,
			  output Carry );
initial begin
    ALUresult = 15'd0;
  end
  

assign Zero = (ALUresult == 0) ? 1 : 0;
assign Negative = (ALUresult < 0) ? 1 : 0; 
assign Carry = ((A+B+C) > 16'b1111111111111111) ? 1 : 0;

always @ (A or B or C or operation)
  begin
    ALUresult = 0; 
    case (operation)    
      6'b000100: // AND 
        begin
          ALUresult <= A & B;
        end     
      6'b000101: // OR
        begin
          ALUresult <= A | B;
        end 
      6'b000001: // add 
        begin
          ALUresult <= A + B + C;
        end 
      6'b000010: // subtract
        begin
          ALUresult <= A - B - C;
        end       
      6'b000110: // XOR
        begin
          ALUresult <= ( A ^ B);
        end
	  6'b010100		//set reset flags
		begin
		  Zero <= 0;
		  Negative <= 0;
		  Carry <= 0;	
		end
      default: 
          ALUresult <= 0;
      endcase 
  end
endmodule 