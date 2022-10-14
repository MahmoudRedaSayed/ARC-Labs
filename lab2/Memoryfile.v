
`include "decoder.v"

module memoryArray #(parameter num=8, w=16)(read_enable,wirte_enable,read_data,write_data,clk,rst,
read_addr,write_addr);

input read_enable,wirte_enable,rst,clk;
input [2:0] read_addr,write_addr;
output [w-1:0] read_data;
input [w-1:0] write_data;
reg [w-1:0] read_data;
reg [num-1:0] [w-1:0] data;
integer selector;

always @(posedge clk)
    begin
        if(read_enable)
        begin
            selector=
            (read_addr==3'b000)?0:
            (read_addr==3'b001)?1:
            (read_addr==3'b010)?2:
            (read_addr==3'b011)?3:
            (read_addr==3'b100)?4:
            (read_addr==3'b101)?5:
            (read_addr==3'b110)?6:
            (read_addr==3'b111)?7:'bx;
            read_data=data[selector] ;
        end
        
    end
always @(negedge clk)
    begin
        if(wirte_enable)
        begin
            selector=
            (write_addr==3'b000)?0:
            (write_addr==3'b001)?1:
            (write_addr==3'b010)?2:
            (write_addr==3'b011)?3:
            (write_addr==3'b100)?4:
            (write_addr==3'b101)?5:
            (write_addr==3'b110)?6:
            (write_addr==3'b111)?7:'bx;
            data[selector]=write_data;
        end
        // select which reg
    end
integer i;
always @( rst)
begin
    for(i=0;i<num;i=i+1)
    begin
        data[i]=0;
    end
end

endmodule