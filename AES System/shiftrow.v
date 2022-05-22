`timescale 1ns / 1ps
module shiftrows(sr_in,sr_out);
    input       [127:0]sr_in;
    output reg  [127:0]sr_out;
    reg [31:0]x1,x2,x3,x4;
    
    always @(*)
    begin
        x1=sr_in[127:96];
        x2=sr_in[95:64];
        x3=sr_in[63:32];
        x4=sr_in[31:0];
        
        sr_out={x1[31:24],x2[23:16],x3[15:8],x4[7:0],
               x2[31:24],x3[23:16],x4[15:8],x1[7:0],
               x3[31:24],x4[23:16],x1[15:8],x2[7:0],
               x4[31:24],x1[23:16],x2[15:8],x3[7:0]};
    end
endmodule
