`timescale 1ns / 1ps

module addroundkey(state,state_out,key);
	input wire [127:0] key;
	input wire [127:0] state;
	output [127:0] state_out;
	
    assign state_out=key^state;
endmodule