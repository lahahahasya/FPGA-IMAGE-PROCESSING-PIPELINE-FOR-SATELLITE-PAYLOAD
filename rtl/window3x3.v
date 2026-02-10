module window3x3 #(parameter W=3124)(
    input clk,
    input [7:0] pixel,
    output reg [7:0] p00,p01,p02,
    output reg [7:0] p10,p11,p12,
    output reg [7:0] p20,p21,p22
);

wire [7:0] lb1,lb2;

line_buffer #(W) L1(clk,pixel,lb1);
line_buffer #(W) L2(clk,lb1,lb2);

always @(posedge clk) begin
    p00<=p01; p01<=p02; p02<=lb2;
    p10<=p11; p11<=p12; p12<=lb1;
    p20<=p21; p21<=p22; p22<=pixel;
end

endmodule
