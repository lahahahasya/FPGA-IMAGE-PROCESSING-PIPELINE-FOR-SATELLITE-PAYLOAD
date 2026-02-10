module gaussian5x5(
    input [7:0] w0,w1,w2,w3,w4,
    input [7:0] w5,w6,w7,w8,w9,
    input [7:0] w10,w11,w12,w13,w14,
    input [7:0] w15,w16,w17,w18,w19,
    input [7:0] w20,w21,w22,w23,w24,
    output reg [7:0] out
);

integer sum;

always @(*) begin
    sum =
        w0*1+w1*4+w2*6+w3*4+w4*1+
        w5*4+w6*16+w7*24+w8*16+w9*4+
        w10*6+w11*24+w12*36+w13*24+w14*6+
        w15*4+w16*16+w17*24+w18*16+w19*4+
        w20*1+w21*4+w22*6+w23*4+w24*1;
    out = sum >> 8;
end

endmodule
