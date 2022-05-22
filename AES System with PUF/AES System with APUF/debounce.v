`timescale 1ns / 1ps
module debounce(
    input clk,
    input  sig_in,
    output sig_out
    );
    reg [19:0]count;
    reg q1,q2,q3;
    
    always@(posedge clk)begin
       q1 <= sig_in;
       q2 <= q1;
       q3 <= q2;
    end
    always@(posedge clk)begin
        if(q3)
            count <= {20{1'b0}};
        else if(!count[19])
            count <= count + 1'b1;
    end
    assign sig_out = ~count[19];
endmodule

