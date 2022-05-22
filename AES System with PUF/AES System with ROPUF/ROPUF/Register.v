`timescale 1ns / 1ps

module Register(
    input [0:15] In,
    input clk,
    input [0:4] count,
    input Reset,
    output reg [0:15] Out 
);

    always@( posedge clk )begin
        
        if( Reset )begin
            Out = 16'd0;
        end

        else begin
            if( count < 5'd20 )begin
                Out <= 16'd0;
            end
            else if( count == 5'd20)begin
                Out <= In;
            end
            else begin
                Out <= Out;
            end
        end

    end

endmodule