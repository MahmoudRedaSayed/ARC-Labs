`include "Register.v"
module MemoryRegisters #(parameter w = 16, num=8) (read_enable,wirte_enable,read_data,write_data,clk,rst,
read_addr,write_addr);
input read_enable,wirte_enable,rst,clk;
input [2:0] read_addr,write_addr;
// commen for all registers
output [w-1:0] read_data;
input [w-1:0] write_data;
wire [w-1:0] data;//
wire [w-1:0] datawirte;//
wire [num-1:0] enableRead;
wire [num-1:0] enablewrite;
reg  [w-1:0] wirteData;
wire [num-1:0] [w-1:0] readData;
integer  selector;

        assign enableRead=(read_enable==1)?1<<read_addr:'bz;
        assign selector=
        (read_addr==3'b000)?0:
        (read_addr==3'b001)?1:
        (read_addr==3'b010)?2:
        (read_addr==3'b011)?3:
        (read_addr==3'b100)?4:
        (read_addr==3'b101)?5:
        (read_addr==3'b110)?6:
        (read_addr==3'b111)?7:'bx;
        assign data=readData[selector];
        assign read_data=(read_enable==1)?data:'bx;
        // select which reg
        assign wirteData=(wirte_enable==1)? write_data : 'bz;
        assign enablewrite=(wirte_enable==1)?1<<write_addr:'bz;

genvar  i;
generate
    for(i=0;i<num;i=i+1)
        Register  #(w) RA (enableRead[i],enablewrite[i],readData[i],wirteData,clk,rst);
endgenerate
endmodule
