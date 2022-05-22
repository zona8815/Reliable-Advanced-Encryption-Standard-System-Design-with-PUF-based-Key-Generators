`timescale 1ns / 1ps
module AES_circuit(data_in,clk,reset,key_input,data_out, sure);
    input       [127:0]data_in;
    input       clk,reset;
    input       [127:0]key_input;
    output reg  [127:0]data_out;
    output reg  sure;
    
    reg     [127:0]in,next_in;
    wire    [31:0]sbout0,sbout1,sbout2,sbout3;
    wire    [127:0]subbyte_out,shiftrows_out,mixcolumn_out,addroundkey_out;
    reg     [127:0]addroundkey_in,roundkey;
    reg     [127:0]key_in,nextkey_in;
    wire    [127:0]key_out;  //for key expansion to add round key
    reg     [3:0]counter,nextcounter;
    
    subbyte sb0(in[127:96],sbout0);  //subbyte(in,out)
    subbyte sb1(in[95:64],sbout1);
    subbyte sb2(in[63:32],sbout2);
    subbyte sb3(in[31:0],sbout3);
    shiftrows sr0(subbyte_out,shiftrows_out);  //shiftrows(in,out)
    mixcolumn mc0(shiftrows_out,mixcolumn_out);  //mixcolumn(in,out)
    addroundkey ark0(addroundkey_in,addroundkey_out,roundkey);  //addroundkey(in,out,key)
    keyexpansion ke0(key_in,counter,key_out);  //keyexpansion(keyinput,clk,reset,keynum,keyoutput)
    
    assign subbyte_out={sbout0,sbout1,sbout2,sbout3};
/////////////////////////////////////////////////////////FSM////////////////////////////////////////////////////////////
    reg     [1:0]state,nextstate;
    parameter reset_state=2'd0;
    parameter start=2'd1;
    parameter middle=2'd2;
    parameter finish=2'd3;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset) begin
            state<=reset_state;
            in<=128'd0;
            counter<=4'd0; end
        else begin
            state<=nextstate;
            in<=next_in;
            counter<=nextcounter;
            key_in<=nextkey_in; 
            end
    end
    
    always@(*)
    begin
        case(state)
            reset_state: begin
                nextcounter=counter;
                if(reset==1'b0) begin
                    nextstate=start; end
                else begin
                    nextstate=reset_state; end
            end
            start: begin
                nextcounter=counter+4'd1;
                if(nextcounter==4'd1) begin
                    nextstate=middle; end
                else begin
                    nextstate=start; end
            end
            middle: begin
                nextcounter=counter+4'd1;
                if(nextcounter==4'd10) begin
                    nextstate=finish; end
                else begin
                    nextstate=middle; end
            end
            finish: begin
                nextcounter=counter;
                nextstate=finish;
            end
        endcase
    end
    
    always@(*)
    begin
        case(state)
            reset_state: begin
                addroundkey_in=data_in;
                next_in=addroundkey_out;
                roundkey=key_input;
                nextkey_in=key_input;
                data_out=128'hffffffffffffffffffffffffffffffff;
                sure = 1'b0;
            end
            start: begin
                addroundkey_in=data_in;
                next_in=addroundkey_out;
                roundkey=key_input;
                nextkey_in=key_out;
                sure = 1'b0;
            end
            middle: begin
                addroundkey_in=mixcolumn_out;
                next_in=addroundkey_out;
                roundkey=key_in;  //from key expansion
                nextkey_in=key_out;
                sure = 1'b0;
            end
            finish: begin
                addroundkey_in=shiftrows_out;
                data_out=addroundkey_out;
                next_in=in;
                roundkey=key_in;
                nextkey_in=key_in;
                sure=1'b1;
            end
        endcase
    end
endmodule
