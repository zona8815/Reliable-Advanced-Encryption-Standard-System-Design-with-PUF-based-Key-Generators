`timescale 1ns / 1ps
module All(clk,reset);  //´úkeygenerator¥Î

    input       clk,reset;
    
    wire         [127:0] data_in;
    wire        [127:0] key_input;
    wire        [127:0]data_out;
    wire        sure;
    
    VIO vio0( .clk(clk), .probe_in0(data_out), .probe_out0(data_in), .probe_out1(key_input));

    AES_circuit a0(data_in, clk, reset, key_input, data_out, sure);

endmodule
