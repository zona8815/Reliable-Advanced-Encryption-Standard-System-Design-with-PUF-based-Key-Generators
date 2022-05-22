`timescale 1ns / 1ps
module keygenerator(clk,reset,key_in,key_out,enable);
    input       clk,reset;
    input       [127:0]key_in;
    output reg  [127:0]key_out;
    output reg  enable;
    
    wire        [7:0]finish;
    wire        [127:0] PUF_Out;
    
    ROPUF r1 (clk, reset, key_in[127:112], finish[0], PUF_Out[127:112]);
    ROPUF r2 (clk, reset, key_in[111:96],  finish[1], PUF_Out[111:96]);
    ROPUF r3 (clk, reset, key_in[95:80],   finish[2], PUF_Out[95:80]);
    ROPUF r4 (clk, reset, key_in[79:64],   finish[3], PUF_Out[79:64]);
    ROPUF r5 (clk, reset, key_in[63:48],   finish[4], PUF_Out[63:48]);
    ROPUF r6 (clk, reset, key_in[47:32],   finish[5], PUF_Out[47:32]);
    ROPUF r7 (clk, reset, key_in[31:16],   finish[6], PUF_Out[31:16]);
    ROPUF r8 (clk, reset, key_in[15:0],    finish[7], PUF_Out[15:0]);
    //Time t0(clk, reset, clk_divided);

    //key_vio vio1( .clk(clk), .probe_in0(key_in[127:112]), .probe_in1(PUF_Out[127:112]), .probe_in2(finish[0]) );
    
    always@(posedge clk or posedge reset)begin

        if(reset) begin
            key_out <= 128'hffffffffffffffffffffffffffffffff;
            enable <= 1'b0; 
        end
        
        else begin
            
            key_out <= PUF_Out;

            if( finish == 8'b11111111 )begin
                enable <= 1'b1;
            end
            
            else begin
                enable <= enable;
            end

        end

    end
    
endmodule
