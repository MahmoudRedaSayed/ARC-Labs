module Register #(parameter w = 16)  (read_enable,wirte_enable,read_data,write_data,clk,rst);
input read_enable,wirte_enable,clk,rst;
output [w-1:0] read_data;
input [w-1:0] write_data;
reg [w-1:0] read_data;
reg [w-1:0] data;
always @(posedge clk) begin
    if(read_enable==1)
    begin
        read_data=data;
    end
    
end
always @(negedge clk) begin
    if(wirte_enable==1)
    begin
        data=write_data;
    end

end
always @( rst) begin
    read_data=0;
    data=0;
end


endmodule
