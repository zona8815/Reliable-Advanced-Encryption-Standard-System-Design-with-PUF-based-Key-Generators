`timescale 1ns / 1ps

(* DONT_TOUCH = "true" *)
module Counter(
    input clk, 
    input Reset,
    output reg [0:15] count);
    
    always@(posedge clk, posedge Reset)begin

        if(Reset)begin
            count <= 16'd0;
        end
        
        else begin

            if( count == 16'b1111_1111_1111_1111 )begin
                count <= count;
            end
            
            else begin
                count <= count + 16'd1;
            end

        end

    end

endmodule