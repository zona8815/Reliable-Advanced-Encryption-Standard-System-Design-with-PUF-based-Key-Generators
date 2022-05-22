`timescale 1ns / 1ps


// for implementation
(* DONT_TOUCH = "true" *)
module mux(In, Sel, Out);
    input [0:15] In;
    input [0:3] Sel;
    output reg Out;

    always@(In or Sel)begin
        case (Sel)
            4'd0: Out = In[0];
            4'd1: Out = In[1];
            4'd2: Out = In[2];
            4'd3: Out = In[3];
            4'd4: Out = In[4];
            4'd5: Out = In[5];
            4'd6: Out = In[6];
            4'd7: Out = In[7];
            4'd8: Out = In[8];
            4'd9: Out = In[9];
            4'ha: Out = In[10];
            4'hb: Out = In[11];
            4'hc: Out = In[12];
            4'hd: Out = In[13];
            4'he: Out = In[14];
            4'hf: Out = In[15];
            default: Out = 1'bz;
        endcase
    end

endmodule


/*
// for simulation
module mux(In, Sel, Out);
    input [0:15] In;
    input [0:3] Sel;
    output Out;
    integer delay1, delay2, delay3, delay4;
    reg out;
    wire [0:15] in;

    always@(In or Sel)begin
        case (Sel)
            4'd0: out = in[0];
            4'd1: out = in[1];
            4'd2: out = in[2];
            4'd3: out = in[3];
            4'd4: out = in[4];
            4'd5: out = in[5];
            4'd6: out = in[6];
            4'd7: out = in[7];
            4'd8: out = in[8];
            4'd9: out = in[9];
            4'd10: out = in[10];
            4'd11: out = in[11];
            4'd12: out = in[12];
            4'd13: out = in[13];
            4'd14: out = in[14];
            4'd15: out = in[15];
            default: out = 1'bz;
        endcase
    end
    
    initial begin
        delay1={$random}%5;
        delay2={$random}%5;
        delay3={$random}%5;
        delay4={$random}%5;
    end
    
    buf #(delay1,delay2) (in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], 
                          In[0], In[1], In[2], In[3], In[4], In[5], In[6], In[7], In[8], In[9], In[10], In[11], In[12], In[13], In[14], In[15]);
    buf #(delay3,delay4) (Out, out);

endmodule
*/