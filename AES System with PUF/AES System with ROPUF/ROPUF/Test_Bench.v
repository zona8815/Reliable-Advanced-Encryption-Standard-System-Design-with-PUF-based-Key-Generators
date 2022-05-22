`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/17 11:48:54
// Design Name: 
// Module Name: Test_Bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Test_Bench();
    
    reg [0:15] challenge;
    reg clk, Reset;
    wire [0:15] Out;
    
    ROPUF test( clk, Reset, challenge, Out);
    
    initial begin
        challenge = 16'b1001011010111000;
        Reset = 1'b1;
        #20 Reset = 1'b0;
    end
    
    initial begin
        clk = 1'b0;
        forever
        #10 clk = ~clk;
    end
    
endmodule
