module tb;

reg clk=0,rst=1,valid=0;
reg [7:0] pixel;
wire [7:0] edge_out;

full_pipeline_top DUT(clk,rst,valid,pixel,edge_out);

always #5 clk=~clk;

integer i;
reg [7:0] mem[0:10000000];
integer f;

initial begin
    f=$fopen("sobel_out.txt","w");
    $readmemh("image_hex.mem",mem);

    #20 rst=0; valid=1;

    for(i=0;i<9000000;i=i+1) begin
        pixel=mem[i];
        #10;
        $fwrite(f,"%d\n",edge_out);
    end

    $fclose(f);
    $stop;
end

endmodule
