module register_file(  input [4:0] read_reg1, read_reg2, write_reg,
                      input [15:0] write_data,
                      input write_en, clk, rst,
                      output [15:0] read_data1, read_data2);
  
    reg [15:0] registers [0:15];
    reg [15:0] read_data1_reg, read_data2_reg;
   
    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2]; 
   
	always @ (negedge rst) begin
	  registers [0] = 0;
	  registers [1] = 0;
	  registers [2] = 0;	  	  
	  registers [3] = 0;
	  registers [4] = 0;	  	
	  registers [5] = 0;
	  registers [6] = 0;
	  registers [7] = 0;	  	  
	  registers [8] = 0;
	  registers [9] = 0;	
	  registers [10] = 0;
	  registers [11] = 0;
	  registers [12] = 0;	  	  
	  registers [13] = 0;
	  registers [14] = 0;		  
	  registers [15] = 0;
	  read_data1_reg = 0;
	  read_data2_reg = 0;
	end
	  	
	  	
	  	
	always @ (posedge clk) begin 
        read_data1_reg = registers[read_reg1];
        read_data2_reg = registers[read_reg2];
        if (write_en && (write_reg != 0)) registers [write_reg] <= write_data;
        registers[read_reg1] = read_data1_reg;
        registers[read_reg2] = read_data2_reg;                
      end
  
 
endmodule
