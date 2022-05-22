`timescale 1ns / 1ps

(* DONT_TOUCH = "true" *)
module Comparator(
    input [0:15] Up_In, Down_In,
    input clk,
    input [0:7] count,
    output reg Out 
);

    always@( count or Up_In or Down_In )begin
        
        if( count >= 8'd245 && count <= 8'd250)begin
            
            if( Up_In >= Down_In )begin
                Out = 1'b1;
            end
            
            else begin
                Out = 1'b0;
            end

        end

        else if( count < 8'd245 )begin
            Out = 1'b0;    
        end

        else begin ; end

    end

endmodule
