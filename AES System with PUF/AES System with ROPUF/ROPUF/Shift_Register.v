`timescale 1ns / 1ps

module Shift_Register(
    input [0:15] challenge, 
    input [0:3] round, // round代表第幾輪
    input [0:4] count,
    input clk, Reset,
    output reg [0:7] Out
);

    reg [0:15] challenge_temp;

    always@( posedge clk )begin
        
        if( round == 4'd0 && count < 5'd10 )begin
            challenge_temp <= challenge;
        end
        
        else if( count == 5'd25 )begin
            challenge_temp[0]  <= challenge_temp[15];
            challenge_temp[1]  <= challenge_temp[0] ;
            challenge_temp[2]  <= challenge_temp[1] ;
            challenge_temp[3]  <= challenge_temp[2] ;
            challenge_temp[4]  <= challenge_temp[3] ;
            challenge_temp[5]  <= challenge_temp[4] ;
            challenge_temp[6]  <= challenge_temp[5] ;
            challenge_temp[7]  <= challenge_temp[6] ;
            challenge_temp[8]  <= challenge_temp[7] ;
            challenge_temp[9]  <= challenge_temp[8] ;
            challenge_temp[10] <= challenge_temp[9] ;
            challenge_temp[11] <= challenge_temp[10];
            challenge_temp[12] <= challenge_temp[11];
            challenge_temp[13] <= challenge_temp[12];
            challenge_temp[14] <= challenge_temp[13];
            challenge_temp[15] <= challenge_temp[14];
        end

        else begin
            challenge_temp <= challenge_temp;
        end

    end

    always@( posedge clk or posedge Reset )begin
        
        if( Reset )begin

            if( challenge_temp[0:3] != challenge_temp[4:7] )begin
                Out <= challenge_temp[0:7];
            end

            else begin
                Out[0:3] <= challenge_temp[0:3];
                Out[4:7] <= challenge_temp[4:7] + 4'd1;
            end

        end

        else begin
            Out <= Out;
        end

    end

endmodule