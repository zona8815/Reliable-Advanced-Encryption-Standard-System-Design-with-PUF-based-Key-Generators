`timescale 1ns / 1ps
(* DONT_TOUCH = "true | yes " *)
module Time(clk,reset,CLK); //°£ÀW¾¹
    input clk,reset;
    output reg CLK;
    reg [26:0]Count;
    
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            Count<=27'd0;
            CLK <= 1'b0; 
        end
        
        else if( Count[2] == 1'b1 )begin
            Count <= Count + 27'd1;
        end

        else if(Count[26]==1'b1) begin
            Count<=27'd0;
            CLK <= ~CLK ;
        end
        
        else begin
            Count<=Count+27'd1; 
        end
    end

endmodule