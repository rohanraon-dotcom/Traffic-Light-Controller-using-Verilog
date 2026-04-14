// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb;

reg clk;
reg reset;
wire [2:0] highway;
wire [2:0] sideway;

traffic uut (
    .clk(clk),
    .reset(reset),
    .highway(highway),
    .sideway(sideway)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    clk = 0;
    reset = 1;

    #10 reset = 0;

    #300 $finish;
end

endmodule