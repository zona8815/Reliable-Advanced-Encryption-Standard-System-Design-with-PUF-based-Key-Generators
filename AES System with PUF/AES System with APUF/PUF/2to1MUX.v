`timescale 1ns / 1ps
/*module MUX2to1(In0, In1, Sel, Out);
    input In0, In1, Sel;
    wire sel, out;
    output wire Out;
   integer delay1, delay2;
    
    initial begin
        delay1=5+{$random}%5;
        delay2=5+{$random}%5;
    end

    buf #(7,3) (sel, Sel);
    assign out= (sel)? In1:In0;
    buf #(delay1,delay2) (Out, out);

endmodule*/
    
    /*module MUX2to1(In0, In1, Sel, Out);
        input In0, In1, Sel;
        wire in0, in1, out;
        output wire Out;
        integer delay1, delay2, delay3, delay4, delay5, delay6;
        initial begin
            delay1=5+{$random}%5;
            delay2=5+{$random}%5;
            delay3=5+{$random}%5;
            delay4=5+{$random}%5;
            delay5=5+{$random}%5;
            delay6=5+{$random}%5;
        end
        assign out= (Sel)? in1:in0;
        buf #(delay1,delay2) (in0, In0);
        buf #(delay3,delay4) (in1, In1);
        buf #(delay5,delay6) (Out, out);
        assign Out=(Sel)?In1:In0;
    endmodule*/
    
/*module MUX2to1(In0, In1, Sel, Out);
    input In0, In1, Sel;
    wire in0, in1;
    output wire Out;
    
    buf #(4) (in0, In0);
    buf #(6) (in1, In1);
    assign Out=(Sel)?in1:in0;
endmodule*/

(* dont_touch = "true" *)
module MUX2to1(In0, In1, Sel, Out);
    input In0, In1, Sel;
    output wire Out;
    
    assign Out=(Sel)?In1:In0;
endmodule