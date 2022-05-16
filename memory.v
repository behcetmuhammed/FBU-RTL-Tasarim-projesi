
module blram(clk, rst, i_we, i_addr, i_ram_data_in, o_ram_data_out);
parameter SIZE = 6;
parameter DEPTH = 64;
parameter TEST_CASE = 1;
input clk; 
input rst;
input i_we;
input [SIZE-1:0] i_addr;
input [9:0] i_ram_data_in;
output reg [9:0] o_ram_data_out;
reg [9:0] memory[0:DEPTH-1];
always @(posedge clk) begin
  o_ram_data_out <= #1 memory[i_addr[SIZE-1:0]];
  if (i_we)
		memory[i_addr[SIZE-1:0]] <= #1 i_ram_data_in;
end 

initial begin
    if(TEST_CASE == 1) begin
	   `include "testCase1.v"
	end else if(TEST_CASE == 2) begin
	   `include "testCase2.v"
	end else if(TEST_CASE == 3) begin
	   `include "testCase3.v"
	end
end 

endmodule
