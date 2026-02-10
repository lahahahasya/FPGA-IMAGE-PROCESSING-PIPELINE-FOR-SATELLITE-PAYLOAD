module line_buffer #(parameter W=3124)(
    input clk,
    input [7:0] din,
    output reg [7:0] dout
);

reg [7:0] mem[0:W-1];
integer i;

always @(posedge clk) begin
    mem[0] <= din;
    for(i=1;i<W;i=i+1)
        mem[i] <= mem[i-1];
    dout <= mem[W-1];
end

endmodule
