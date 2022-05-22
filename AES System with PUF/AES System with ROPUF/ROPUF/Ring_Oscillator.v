`timescale 1ns / 1ps

(* DONT_TOUCH = "true" *)
module Ring_Oscillator(In1, In2, Reset, Out);

    input In1, In2, Reset;
    output Out;
    wire nand_out, InvOut1, InvOut2, InvOut3, RO_Out;
    wire enable;

    (* DONT_TOUCH = "true" *) assign enable = In1 || In2;
    (* DONT_TOUCH = "true" *) assign nand_out = ~ (enable & Out);
    (* DONT_TOUCH = "true" *) inverter Inv1(.In(nand_out), .Out(InvOut1));
    (* DONT_TOUCH = "true" *) inverter Inv2(.In(InvOut1), .Out(InvOut2));
    (* DONT_TOUCH = "true" *) inverter Inv3(.In(InvOut2), .Out(InvOut3));
    (* DONT_TOUCH = "true" *) inverter Inv4(.In(InvOut3), .Out(RO_Out));
    (* DONT_TOUCH = "true" *) assign Out = (Reset)? 1'b1 : RO_Out;

endmodule