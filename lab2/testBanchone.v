`include"RegistersFile.v"
`include"Memoryfile.v"
module TestBench();
localparam  w = 16;
localparam  n = 8;
localparam  T = 200;
reg read_enable,wirte_enable,rst,clk;
reg [2:0] read_addr,write_addr;
wire [w-1:0] read_data,read_data_1;
reg [w-1:0] write_data;
MemoryRegisters #(w,n) RegistersTest (read_enable,wirte_enable,read_data,write_data,clk,rst,
read_addr,write_addr);
memoryArray #(n, w) ArrayTest(read_enable,wirte_enable,read_data_1,write_data,clk,rst,
read_addr,write_addr);
initial
begin
    $monitor("the data read_enable=%b  write_enable=%b  read_data=%b  write_data=%b  read_addr=%b write_addr=%b for Registers ",
    read_enable,wirte_enable,read_data,write_data,
    read_addr,write_addr);
    $monitor(" the data read_enable=%b  write_enable=%b  read_data=%b  write_data=%b  read_addr=%b write_addr=%b for Arrays ",
    read_enable,wirte_enable,read_data_1,write_data,
    read_addr,write_addr);
end

initial begin
    $display(" test 1 case write data in position 000");
    wirte_enable =1;
    read_enable =0;
    write_addr= 3'b000;
    write_data= 16'b0000111100001111;
    #T;

    $display(" test 2 case read data in position 000");
    read_enable =1;
    wirte_enable =0;
    read_addr= 3'b000;
    #T;
    #T;
    if(read_data==16'b0000111100001111 &&read_data_1==16'b0000111100001111 )
        $display("test case one and two success");
    $display(" test 3 case write data in position 011");
    wirte_enable =1;
    read_enable =0;
    write_addr= 3'b011;
    write_data= 16'b0000111111111111;
    #T;

    $display(" test 4 case read data in position 011");
    read_enable =1;
    wirte_enable =0;
    read_addr= 3'b011;
    #T;
    #T;
    if(read_data==16'b0000111111111111&&read_data_1==16'b0000111111111111)
        $display("test case 3 and 4 success");
    
    $display(" test 5 case write data in position 111");
    wirte_enable =1;
    read_enable =0;
    write_addr= 3'b111;
    write_data= 16'b0000111111111111;
    #T;

    $display(" test 6 case read data in position 111");
    read_enable =1;
    wirte_enable =0;
    read_addr= 3'b111;
    #T;
    #T;
    if(read_data==16'b0000111111111111&&read_data_1==16'b0000111111111111)
        $display("test case 5 and 6 success");

    $display(" test 7 case write data in position 111 and enable the write and read");
    wirte_enable =1;
    read_enable =1;
    write_addr= 3'b111;
    write_data= 16'b1100111111111111;
    #T;
    #T;
    $display(" test 8 case check the read data of test 7");
    read_enable =1;
    wirte_enable =0;
    read_addr= 3'b111;
    #T;
    #T;
    if(read_data==16'b1100111111111111&&read_data_1==16'b1100111111111111)
        $display("test case 8 success");
    $display(" test 9 case check the reset with the enables");
    rst=1;
    #50;
    read_enable =1;
    read_addr= 3'b111;
    #T;
    #T;
    if(read_data==16'b0000000000000000&&read_data_1==16'b0000000000000000)
        $display("test case 9 success");

end

endmodule
