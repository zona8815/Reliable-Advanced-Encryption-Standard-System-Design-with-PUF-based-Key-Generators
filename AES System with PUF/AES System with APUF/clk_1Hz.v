`timescale 1ns / 1ps

module clk_1Hz(clk,clk1,reset);
    input clk,reset;
    output clk1;
    reg [28:0] count;
    
    always @(posedge clk)
    begin
        if (reset) count <= 29'b0;
        else count <= count +1'b1;
    end
    
    assign clk1=count[28]; //1.5Hz
endmodule

