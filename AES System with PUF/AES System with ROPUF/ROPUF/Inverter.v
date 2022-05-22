`timescale 1ns / 1ps

(* DONT_TOUCH = "true" *)
module inverter(In, Out);
    input In;
    output Out;
    /*integer delay1, delay2, delay3, delay4;
    wire in, out;

    initial begin
        delay1 = {$random}%5;
        delay2 = {$random}%5;
        delay3 = {$random}%5;
        delay4 = {$random}%5;
    end*/
    
    //assign out = ~ in;
    //buf #(delay1,delay2) (in, In);
    //buf #(delay3, delay4) (Out, out);
    not (Out, In);
    
endmodule