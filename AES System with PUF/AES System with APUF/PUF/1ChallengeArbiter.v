`timescale 1ns / 1ps

(* dont_touch = "true" *)
module Challenge1Arbiter(In0, In1, Challenge, Out0, Out1);
    input Challenge, In0, In1;
    output wire Out0, Out1;

    MUX2to1 UpMux(.In0(In0), .In1(In1), .Sel(Challenge), .Out(Out0));
    MUX2to1 DownMux(.In0(In1), .In1(In0), .Sel(Challenge), .Out(Out1));
endmodule

/*module Challenge1Arbiter(In0, In1, Challenge, Out0, Out1);
    input Challenge, In0, In1;
    output wire Out0, Out1;
    wire Challenge0,Challenge1;
    
    buf #(7,3) (Challenge0,Challenge);
    buf #(1,3) (Challenge1,Challenge);

    MUX2to1 UpMux(.In0(In0), .In1(In1), .Sel(Challenge0), .Out(Out0));
    MUX2to1 DownMux(.In0(In1), .In1(In0), .Sel(Challenge1), .Out(Out1));
endmodule*/
