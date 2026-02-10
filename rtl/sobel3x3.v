module sobel3x3(
    input signed [7:0] p00,p01,p02,
    input signed [7:0] p10,p11,p12,
    input signed [7:0] p20,p21,p22,
    output reg [7:0] edge_out
);

reg signed [11:0] sx,sy;
reg [12:0] mag;

always @(*) begin
    sx = (p02 + (p12<<1) + p22) - (p00 + (p10<<1) + p20);
    sy = (p20 + (p21<<1) + p22) - (p00 + (p01<<1) + p02);
    mag = (sx<0?-sx:sx) + (sy<0?-sy:sy);

    if(mag>255) edge_out=8'd255;
    else edge_out=mag[7:0];
end

endmodule
