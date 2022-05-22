`timescale 1ns / 1ps

(* DONT_TOUCH = "true" *) 
module ROPUF(
    input clk, Reset,
    //input [0:15] challenge,
    output up_out, down_out
);

    reg [0:3] round; // 第幾個round
    reg [0:7] count; // 每round中的第幾個clock
    reg reset; // local reset
    wire [0:15] challenge;
    reg [0:15] Out;


    always@( posedge clk or posedge Reset )begin
    
        if( Reset )begin
            count <= 8'd0;
        end

        else begin

            if( count == 8'd255 && round == 4'd15 )begin
                count <= count;
            end
            else begin
                count <= count + 8'd1;
            end
        end

    end

    always@(posedge clk or posedge Reset )begin
    
        if( Reset )begin
            round <= 4'd0;
            reset <= 1'b1;
        end

        else begin

            if( count == 8'd0 )begin
                round <= round;
                reset <= 1'd0;
            end
            else if( count == 8'd255 )begin
                if( round == 4'd15 )begin
                    round <= round;
                    reset <= reset;
                end
                else begin
                    round <= round + 4'd1;
                    reset <= 1'b1;
                end
            end
            else begin
                round <= round;
                reset <= 1'b0;
            end

        end
    
    end

    wire [0:7] challenge_temp;
    wire [0:15] Up_Decode, Down_Decode, RO_Out, RO_Out_divide;
    wire Up_Mux_Out, Down_Mux_Out;
    wire [0:15] Up_Count_Out, Down_Count_Out, Up_Reg_Out, Down_Reg_Out;
    wire comparator_out;
    wire [0:15] out_temp;

    (* DONT_TOUCH = "true" *) Shift_Register shift_reg( challenge, round, count, clk, reset, challenge_temp );

    (* DONT_TOUCH = "true" *) Decoder Up_Decoder( challenge_temp[0:3], Up_Decode);
    (* DONT_TOUCH = "true" *) Decoder Down_Decoder( challenge_temp[4:7], Down_Decode);

    (* DONT_TOUCH = "true" *) Ring_Oscillator RO1( .In1(Up_Decode[0]),  .In2(Down_Decode[0]),  .Out(RO_Out[0]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO2( .In1(Up_Decode[1]),  .In2(Down_Decode[1]),  .Out(RO_Out[1]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO3( .In1(Up_Decode[2]),  .In2(Down_Decode[2]),  .Out(RO_Out[2]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO4( .In1(Up_Decode[3]),  .In2(Down_Decode[3]),  .Out(RO_Out[3]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO5( .In1(Up_Decode[4]),  .In2(Down_Decode[4]),  .Out(RO_Out[4]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO6( .In1(Up_Decode[5]),  .In2(Down_Decode[5]),  .Out(RO_Out[5]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO7( .In1(Up_Decode[6]),  .In2(Down_Decode[6]),  .Out(RO_Out[6]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO8( .In1(Up_Decode[7]),  .In2(Down_Decode[7]),  .Out(RO_Out[7]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO9( .In1(Up_Decode[8]),  .In2(Down_Decode[8]),  .Out(RO_Out[8]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO10(.In1(Up_Decode[9]),  .In2(Down_Decode[9]),  .Out(RO_Out[9]),  .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO11(.In1(Up_Decode[10]), .In2(Down_Decode[10]), .Out(RO_Out[10]), .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO12(.In1(Up_Decode[11]), .In2(Down_Decode[11]), .Out(RO_Out[11]), .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO13(.In1(Up_Decode[12]), .In2(Down_Decode[12]), .Out(RO_Out[12]), .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO14(.In1(Up_Decode[13]), .In2(Down_Decode[13]), .Out(RO_Out[13]), .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO15(.In1(Up_Decode[14]), .In2(Down_Decode[14]), .Out(RO_Out[14]), .Reset(reset));
    (* DONT_TOUCH = "true" *) Ring_Oscillator RO16(.In1(Up_Decode[15]), .In2(Down_Decode[15]), .Out(RO_Out[15]), .Reset(reset));
    
    (* DONT_TOUCH = "true" *) Time time0 ( RO_Out[0],  Reset, check[0 ], RO_Out_divide[0 ]);
    (* DONT_TOUCH = "true" *) Time time1 ( RO_Out[1],  Reset, check[1 ], RO_Out_divide[1 ]);
    (* DONT_TOUCH = "true" *) Time time2 ( RO_Out[2],  Reset, check[2 ], RO_Out_divide[2 ]);
    (* DONT_TOUCH = "true" *) Time time3 ( RO_Out[3],  Reset, check[3 ], RO_Out_divide[3 ]);
    (* DONT_TOUCH = "true" *) Time time4 ( RO_Out[4],  Reset, check[4 ], RO_Out_divide[4 ]);
    (* DONT_TOUCH = "true" *) Time time5 ( RO_Out[5],  Reset, check[5 ], RO_Out_divide[5 ]);
    (* DONT_TOUCH = "true" *) Time time6 ( RO_Out[6],  Reset, check[6 ], RO_Out_divide[6 ]);
    (* DONT_TOUCH = "true" *) Time time7 ( RO_Out[7],  Reset, check[7 ], RO_Out_divide[7 ]);
    (* DONT_TOUCH = "true" *) Time time8 ( RO_Out[8],  Reset, check[8 ], RO_Out_divide[8 ]);
    (* DONT_TOUCH = "true" *) Time time9 ( RO_Out[9],  Reset, check[9 ], RO_Out_divide[9 ]);
    (* DONT_TOUCH = "true" *) Time time10( RO_Out[10], Reset, check[10], RO_Out_divide[10]);
    (* DONT_TOUCH = "true" *) Time time11( RO_Out[11], Reset, check[11], RO_Out_divide[11]);
    (* DONT_TOUCH = "true" *) Time time12( RO_Out[12], Reset, check[12], RO_Out_divide[12]);
    (* DONT_TOUCH = "true" *) Time time13( RO_Out[13], Reset, check[13], RO_Out_divide[13]);
    (* DONT_TOUCH = "true" *) Time time14( RO_Out[14], Reset, check[14], RO_Out_divide[14]);
    (* DONT_TOUCH = "true" *) Time time15( RO_Out[15], Reset, check[15], RO_Out_divide[15]);

    (* DONT_TOUCH = "true" *) mux UpMux(.In(RO_Out_divide), .Sel(challenge_temp[0:3]), .Out(Up_Mux_Out));
    (* DONT_TOUCH = "true" *) mux DownMux(.In(RO_Out_divide), .Sel(challenge_temp[4:7]), .Out(Down_Mux_Out));

    (* DONT_TOUCH = "true" *) Counter Up_Counter( Up_Mux_Out, reset, Up_Count_Out);
    (* DONT_TOUCH = "true" *) Register Up_Reg( Up_Count_Out, clk, count, reset, Up_Reg_Out);

    (* DONT_TOUCH = "true" *) Counter Down_Counter( Down_Mux_Out, reset, Down_Count_Out);
    (* DONT_TOUCH = "true" *) Register Down_Reg( Down_Count_Out, clk, count, reset, Down_Reg_Out);

    (* DONT_TOUCH = "true" *) Comparator comparison_unit( Up_Reg_Out, Down_Reg_Out, clk, count, comparator_out);

    (* DONT_TOUCH = "true" *) Response_Register out_reg( comparator_out, clk, round, count, Reset, out_temp);

    wire [0:15] check;
    


    (* DONT_TOUCH = "true" *) Time time_up( Up_Mux_Out, Reset, up_out);
    (* DONT_TOUCH = "true" *) Time time_down( Down_Mux_Out, Reset, down_out);
    
    always@(*)begin
    
        if( round == 4'd15 && count > 8'd250)begin
            Out = out_temp;
        end
        
        else begin
            Out = 16'd0;
        end
    
    end

    VIO vio0( .clk(clk), .probe_in0(Out), .probe_in1(check), .probe_in2(RO_Out_divide), 
                .probe_in3(round), .probe_in4(count), .probe_in5( challenge_temp),
                .probe_in6(Up_Reg_Out), .probe_in7(Down_Reg_Out), .probe_in8(comparator_out),
                .probe_in9(out_temp),
                .probe_out0(challenge) 
            );

endmodule