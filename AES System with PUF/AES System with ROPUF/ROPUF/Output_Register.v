`timescale 1ns / 1ps

(* DONT_TOUCH = "true" *) 
module Response_Register(
    input In, clk,
    input [0:3] round,
    input [0:4] count,
    input Reset,
    output reg [0:15] Out
);

    always@( posedge clk )begin

        if( Reset || ( round == 4'd0 && count == 5'd0 ) )begin
            Out <= 16'd0;
        end
        else if( count == 5'd25 )begin
            
            case( round )
                4'd0:  Out[0]  <= In;
                4'd1:  Out[1]  <= In;
                4'd2:  Out[2]  <= In;
                4'd3:  Out[3]  <= In;
                4'd4:  Out[4]  <= In;
                4'd5:  Out[5]  <= In;
                4'd6:  Out[6]  <= In;
                4'd7:  Out[7]  <= In;
                4'd8:  Out[8]  <= In;
                4'd9:  Out[9]  <= In;
                4'd10: Out[10] <= In;
                4'd11: Out[11] <= In;
                4'd12: Out[12] <= In;
                4'd13: Out[13] <= In;
                4'd14: Out[14] <= In;
                4'd15: Out[15] <= In;
            endcase

        end

        else begin
            Out <= Out;
        end
    
    end

endmodule

