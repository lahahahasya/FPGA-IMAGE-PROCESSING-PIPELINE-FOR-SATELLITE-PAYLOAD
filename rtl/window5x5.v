module window5x5 #(parameter W=3124)(
    input clk,
    input [7:0] pixel,
    output reg [7:0] w0,w1,w2,w3,w4,
    output reg [7:0] w5,w6,w7,w8,w9,
    output reg [7:0] w10,w11,w12,w13,w14,
    output reg [7:0] w15,w16,w17,w18,w19,
    output reg [7:0] w20,w21,w22,w23,w24
);

wire [7:0] lb1,lb2,lb3,lb4;

line_buffer #(W) L1(clk,pixel,lb1);
line_buffer #(W) L2(clk,lb1,lb2);
line_buffer #(W) L3(clk,lb2,lb3);
line_buffer #(W) L4(clk,lb3,lb4);

always @(posedge clk) begin
    w0<=w1; w1<=w2; w2<=w3; w3<=w4; w4<=lb4;
    w5<=w6; w6<=w7; w7<=w8; w8<=w9; w9<=lb3;
    w10<=w11; w11<=w12; w12<=w13; w13<=w14; w14<=lb2;
    w15<=w16; w16<=w17; w17<=w18; w18<=w19; w19<=lb1;
    w20<=w21; w21<=w22; w22<=w23; w23<=w24; w24<=pixel;
end

endmodule
