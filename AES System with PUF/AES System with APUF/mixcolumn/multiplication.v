`timescale 1ns / 1ps

module MUL2(In, Out);
    input [7:0] In;
    output [7:0] Out;

    assign Out[7]=In[6];
    assign Out[6]=In[5];
    assign Out[5]=In[4];
    assign Out[4]=In[3]^In[7];
    assign Out[3]=In[2]^In[7];
    assign Out[2]=In[1];
    assign Out[1]=In[0]^In[7];
    assign Out[0]=In[7];

endmodule