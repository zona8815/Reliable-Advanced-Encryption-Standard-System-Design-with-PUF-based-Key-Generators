`timescale 1ns / 1ps
(* dont_touch = "true" *)
module Time(clk,reset,CLK); //°£ÀW¾¹
    input clk,reset;
    output reg CLK;
    reg [4:0]Count;
    
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            Count<=5'd0;
            CLK<=1'b1; end
        else if(Count[4]==1'b1) begin
            Count<=5'd0;
            CLK<=~CLK; end
        else begin
            Count<=Count+5'd1; end
    end
endmodule