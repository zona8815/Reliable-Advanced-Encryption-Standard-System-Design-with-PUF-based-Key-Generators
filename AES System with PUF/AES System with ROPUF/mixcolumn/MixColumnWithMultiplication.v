`timescale 1ns / 1ps

module mixcolumn(in_data, C_data);

    input [0:127] in_data;
    output [0:127] C_data;

    Column_Multiplication uut0( .a0(in_data[0:7]), .a1(in_data[8:15]), .a2(in_data[16:23]), .a3(in_data[24:31]), 
                                .b0(C_data[0:7]), .b1(C_data[8:15]), .b2(C_data[16:23]), .b3(C_data[24:31]));

    Column_Multiplication uut1( .a0(in_data[32:39]), .a1(in_data[40:47]), .a2(in_data[48:55]), .a3(in_data[56:63]),
                                .b0(C_data[32:39]), .b1(C_data[40:47]), .b2(C_data[48:55]), .b3(C_data[56:63]));

    Column_Multiplication uut2( .a0(in_data[64:71]), .a1(in_data[72:79]), .a2(in_data[80:87]), .a3(in_data[88:95]), 
                                .b0(C_data[64:71]), .b1(C_data[72:79]), .b2(C_data[80:87]), .b3(C_data[88:95]));

    Column_Multiplication uut3( .a0(in_data[96:103]), .a1(in_data[104:111]), .a2(in_data[112:119]), .a3(in_data[120:127]), 
                                .b0(C_data[96:103]), .b1(C_data[104:111]), .b2(C_data[112:119]), .b3(C_data[120:127]));

    
endmodule