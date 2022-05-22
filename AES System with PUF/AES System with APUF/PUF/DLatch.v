`timescale 1ns / 1ps

(* dont_touch = "true" *)
module DFF(In, enable, reset, Out);
    input In, enable, reset;
    output reg Out;

    always@(posedge enable or posedge reset)begin
        if(reset)
            Out=1'b0;
        else
            Out=In;
    end
endmodule