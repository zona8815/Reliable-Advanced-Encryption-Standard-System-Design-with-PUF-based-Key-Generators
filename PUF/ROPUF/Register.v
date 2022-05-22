`timescale 1ns / 1ps

module Register(
    input [0:15] In,
    input clk,
    input [0:7] count,
    input Reset,
    output reg [0:15] Out 
);

    always@( posedge clk )begin
        
        if( Reset )begin
            Out = 16'd0;
        end

        else begin
            if( count < 8'd240 )begin
                Out <= 16'd0;
            end
            else if( count == 8'd240)begin
                Out <= In;
            end
            else begin
                Out <= Out;
            end
        end

    end

endmodule