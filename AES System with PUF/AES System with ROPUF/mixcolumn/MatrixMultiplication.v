`timescale 1ns / 1ps

module Column_Multiplication(a0,a1,a2,a3,b0,b1,b2,b3);

    input [7:0] a0, a1, a2, a3;
    output [7:0] b0, b1, b2, b3;

    wire [7:0] temp2 [0:3];    //data multiply by 2
    wire [7:0] temp3 [0:3];    //data multiply by 3

    MUL2 mul2_0(.In(a0), .Out(temp2[0]));
    MUL2 mul2_1(.In(a1), .Out(temp2[1]));
    MUL2 mul2_2(.In(a2), .Out(temp2[2]));
    MUL2 mul2_3(.In(a3), .Out(temp2[3]));

    assign temp3[0]=temp2[0]^a0;
    assign temp3[1]=temp2[1]^a1;
    assign temp3[2]=temp2[2]^a2;
    assign temp3[3]=temp2[3]^a3;
    
    assign b0=temp2[0]^temp3[1]^a2^a3;
    assign b1=temp2[1]^temp3[2]^a3^a0;
    assign b2=temp2[2]^temp3[3]^a0^a1;
    assign b3=temp2[3]^temp3[0]^a1^a2;

endmodule