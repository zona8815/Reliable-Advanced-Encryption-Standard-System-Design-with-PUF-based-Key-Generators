`timescale 1ns / 1ps

module keyexpansion(keyInput,keyNum,keyOutput);
    input  [127:0] keyInput;
	input [3:0] keyNum;
    output  reg [127:0] keyOutput;
    
    wire [31:0] stp1, stp2, Rcon ;
    wire [3:0] num;

    rcon uut1 (.r(num),.rcon(Rcon));
    subbyte uut2 (.sbox_in(stp1) , .sbox_out(stp2));
    assign stp1 = { keyInput[23:0] , keyInput[31:24] }; 
    assign num = keyNum + 4'd1;
	
    always @(*) begin
        keyOutput[127:96] = keyInput[127:96] ^ stp2 ^ Rcon; 	
        keyOutput[95:64] = keyInput[95:64] ^ keyOutput[127:96];
        keyOutput[63:32] = keyInput[63:32] ^ keyOutput[95:64];
        keyOutput[31:0] = keyInput[31:0] ^ keyOutput[63:32];
    end
endmodule