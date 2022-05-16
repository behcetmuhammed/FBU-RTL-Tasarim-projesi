`timescale 1ns / 1ps

module FBCPU #(
    parameter ADDRESS_WIDTH = 6,
    parameter DATA_WIDTH = 10
)(
    input clk, 
    input rst, 
    output reg [DATA_WIDTH-1:0] MDRIn, 
    output reg RAMWr, 
    output reg [ADDRESS_WIDTH-1:0] MAR, 
    input [DATA_WIDTH-1:0] MDROut, 
    output reg [5:0] PC
);

reg [DATA_WIDTH - 1:0] IR, IRNext;
reg [5:0] PCNext;
reg [9:0] ACC, ACCNext;
reg [2:0] durum, durumNext;

always@(posedge clk) begin
    durum       <= #1 durumNext;
    PC          <= #1 PCNext;
    IR          <= #1 IRNext;
    ACC         <= #1 ACCNext;
end

always@(*) begin
    durumNext   = durum;
    PCNext      = PC;
    IRNext      = IR;
    ACCNext     = ACC;
    MAR         = 0;
    RAMWr       = 0;
    MDRIn       = 0;
    
    if(rst) begin
        durumNext   = 0;
        PCNext      = 0;
        IRNext      = 0;
        ACCNext     = 0;
        MAR         = 0;
        RAMWr       = 0;
        MDRIn       = 0;
    end else begin
        case(durum)
            0: begin
                MAR = PC;
                RAMWr = 0;
                durumNext = durum + 1;
            end       
            1: begin 
                IRNext = MDROut;
                PCNext = PC + 1;
                durumNext = durum + 1;
            end            
            2: begin 
               if(IR[9:6] <6) begin
                  MAR = IR[5:0];
                  durumNext = 3;               
               end else if(IR[9:6] == 6) begin
                  durumNext = 0;
                  PCNext = IR[5:0];           
               end else if(IR[9:6] == 7) begin
                  if(ACC==0) begin
                       PCNext = IR[5:0];
                  end
                      durumNext = 0;       
               end else if(IR[9:6] == 8) begin
                   durumNext = 0;
               end else if(IR[9:6] == 9) begin
                  durumNext = 4;
               end 
            end         
            3: begin
             durumNext=0;
             RAMWr=0;
             MAR=0;
             if(IR[9:6]==0)begin
                ACCNext=MDROut;
             end else if(IR[9:6]==1)begin
                 MAR=IR[5:0];
                 RAMWr=1;
                 MDRIn=ACC;
             end else if(IR[9:6]==2)begin
               ACCNext=ACC+MDROut;
             end else if(IR[9:6]==3)begin
               ACCNext=ACC-MDROut;
             end else if(IR[9:6]==4)begin
               ACCNext=ACC*MDROut;
             end else if(IR[9:6]==5)begin
               ACCNext=ACC/MDROut;
            end

            end
			
            4: begin
				durumNext=4;
            end
        endcase
    end
end

endmodule
