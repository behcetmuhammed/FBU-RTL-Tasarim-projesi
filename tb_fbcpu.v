`timescale 1ns / 1ps
module tb_fbcpu;

    parameter TEST_CASE = 3;
    
    parameter ADDRESS_WIDTH = 6;
    parameter DATA_WIDTH = 10;
    
    reg clk = 1;
    reg rst;
    
    wire [ADDRESS_WIDTH-1:0] addr_toRAM;
    wire [DATA_WIDTH-1:0] data_toRAM, data_fromRAM;
    wire [ADDRESS_WIDTH-1:0] pCounter;
    wire wrEn;

    always clk = #5 !clk;
    
    initial begin
      rst = 1;
      repeat (10) @(posedge clk);
      rst <= #1 0;
      repeat (10000) @(posedge clk);
      
      if(TEST_CASE == 1)
        memCheck(52,15);
      
      else if(TEST_CASE == 2)
        memCheck(52,50);
      
      else if(TEST_CASE == 3)
        memCheck(52,50);
      
      $finish;
    end
    
    FBCPU #(
        ADDRESS_WIDTH,
        DATA_WIDTH
    ) FBCPU_Inst(
        .clk(clk), 
        .rst(rst), 
        .MDRIn(data_toRAM), 
        .RAMWr(wrEn), 
        .MAR(addr_toRAM), 
        .MDROut(data_fromRAM), 
        .PC(pCounter)
    );
    
    blram #(ADDRESS_WIDTH, 64, TEST_CASE) blram(
      .clk(clk),
      .rst(rst),
      .i_we(wrEn),
      .i_addr(addr_toRAM),
      .i_ram_data_in(data_toRAM),
      .o_ram_data_out(data_fromRAM)
    );
    
    task memCheck;
        input [31:0] memLocation, expectedValue;
        begin
          if(blram.memory[memLocation] !== expectedValue) begin
                $display("Test Hatali Tamamlandi!");
          end else begin
                $display("Test Basarili Tamamlandi!");
          end
        end
    endtask
    
endmodule
