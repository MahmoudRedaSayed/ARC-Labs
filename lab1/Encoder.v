
module encoder(in,out,en);
input [7:0] in;
output [2:0] out;
input en;
assign out=(en==1)?
(

        
        (in==8'b10000000)? (3'b111):
        (in==8'b01000000)? (3'b110):
        (in==8'b00100000)? (3'b101):
        (in==8'b00010000)? (3'b100):
        (in==8'b00001000)? (3'b011):
        (in==8'b00000100)? (3'b010):
	(in==8'b00000010)? (3'b001):
	(in==8'b00000001)? (3'b000):
        (3'bxxx)
)
:(3'bzzz);

endmodule