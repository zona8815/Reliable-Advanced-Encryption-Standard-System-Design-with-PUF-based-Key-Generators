`timescale 1ns / 1ps
module keygenerator(clk,reset,key_in,key_out,enable);
    input       clk,reset;
    input       [127:0]key_in;
    output reg  [127:0]key_out;
    output reg  enable;
    wire        [15:0]response;
    reg         [15:0]challenge;
    wire        clk_divided;
    reg         [3:0]counter;
    
    challenge16Arbiter c0(clk, challenge, reset, response[0]);
    challenge16Arbiter c1(clk, challenge, reset, response[1]);
    challenge16Arbiter c2(clk, challenge, reset, response[2]);
    challenge16Arbiter c3(clk, challenge, reset, response[3]);
    challenge16Arbiter c4(clk, challenge, reset, response[4]);
    challenge16Arbiter c5(clk, challenge, reset, response[5]);
    challenge16Arbiter c6(clk, challenge, reset, response[6]);
    challenge16Arbiter c7(clk, challenge, reset, response[7]);
    challenge16Arbiter c8(clk, challenge, reset, response[8]);
    challenge16Arbiter c9(clk, challenge, reset, response[9]);
    challenge16Arbiter c10(clk, challenge, reset, response[10]);
    challenge16Arbiter c11(clk, challenge, reset, response[11]);
    challenge16Arbiter c12(clk, challenge, reset, response[12]);
    challenge16Arbiter c13(clk, challenge, reset, response[13]);
    challenge16Arbiter c14(clk, challenge, reset, response[14]);
    challenge16Arbiter c15(clk, challenge, reset, response[15]);
    Time t0(clk, reset, clk_divided);
    
    always@(posedge clk_divided or posedge reset)
    begin
        if(reset) begin
            key_out<=128'd0;
            counter<=4'd0;
            enable<=1'b0; end
        else begin
            case(counter)
                4'd0:begin challenge<=key_in[127:112]; end
                4'd1:begin key_out[127:112]<=response;  challenge<=key_in[111:96];  end
                4'd2:begin key_out[111:96]<=response;   challenge<=key_in[95:80];   end
                4'd3:begin key_out[95:80]<=response;    challenge<=key_in[79:64];   end
                4'd4:begin key_out[79:64]<=response;    challenge<=key_in[63:48];   end
                4'd5:begin key_out[63:48]<=response;    challenge<=key_in[47:32];   end
                4'd6:begin key_out[47:32]<=response;    challenge<=key_in[31:16];   end
                4'd7:begin key_out[31:16]<=response;    challenge<=key_in[15:0];    end
                4'd8:begin key_out[15:0] <=response;  end
                4'd9:begin enable<=1'b1; end  //把key輸出出去，準確來說是讓aes抓key
                default:begin key_out<=key_out; end
            endcase
            if (counter<=4'd8) begin
                counter<=counter+4'd1; end
            else begin
                counter<=counter; end
            end
    end
endmodule
