module bg_subtract (
input [7:0] pixel ,
input [7:0] median ,
output [7:0] out
) ;
assign out = ( pixel > median ) ? ( pixel - median ) : 8 ’ d0 ;
endmodule
