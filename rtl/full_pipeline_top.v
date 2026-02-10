module full_pipeline_top #(parameter W=3124)(
    input clk,
    input rst,
    input valid,
    input [7:0] pixel_in,
    output [7:0] edge_out
);

wire [7:0] bg;
assign bg = pixel_in;

wire [7:0] p00,p01,p02,p10,p11,p12,p20,p21,p22;

window3x3 #(W) W3(clk,bg,p00,p01,p02,p10,p11,p12,p20,p21,p22);
sobel3x3 SOB(p00,p01,p02,p10,p11,p12,p20,p21,p22,edge_out);

endmodule
