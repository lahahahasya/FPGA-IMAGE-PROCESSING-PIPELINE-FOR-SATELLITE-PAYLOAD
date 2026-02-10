module bg_subtract (
2 input [7:0] pixel ,
3 input [7:0] median ,
4 output [7:0] out
5 ) ;
6 assign out = ( pixel > median ) ? ( pixel - median ) : 8 ’ d0 ;
7 endmodule
