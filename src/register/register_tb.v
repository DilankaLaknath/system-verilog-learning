`timescale 1ns/1ps

module register_tb();

localparam width = 12;
localparam CLK_PERIOD = 20; // 20ns = 50MHz
localparam SEED = 33;

//Input --> reg data type
//output --> wire data type
reg [width-1:0]dataIn;
reg WrEn,rst,clk;
wire [width-1:0] dataOut;

////// Creat Clock ///////
initial begin
    clk = 1'b0;
    forever begin
        #(CLK_PERIOD/2);
        clk = ~clk;
    end
end

//// instantiate the module in the test bench /////////
register #(.width(width)) dut(.clk(clk), .rst(rst), .WrEn(WrEn), .dataIn(dataIn), .dataOut(dataOut));

initial begin
    @(posedge clk);
    rst <= 0; //since reset on negative edge

    @(posedge clk);
    rst <= 1;
    dataIn <= 20;
    WrEn <= 0;

    @(posedge clk);
    dataIn <= 43;
    WrEn <= 1;

    repeat(10) @(posedge clk) begin
        dataIn <= $random;
        WrEn <= $random;
        $display("%12b ", dataIn);
    end
    $stop;
end

endmodule