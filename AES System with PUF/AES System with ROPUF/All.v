`timescale 1ns / 1ps
module All(clk,reset);  //´úkeygenerator¥Î

    input       clk,reset;
    //output reg  [7:0]led;
    
    reg         [127:0] data_in; 
    wire        [127:0] data;
    //reg         [127:0] data_in=128'd0;
    //reg         [127:0] key_input=128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
    wire        [127:0] key_input;
    wire        [127:0] data_out,key_out;
    wire        Reset,clk_divided,reset_in, sure;
    wire        enable;
    //reg         [5:0]counter;
    
    assign Reset = reset;
    assign reset_in=~enable;

    reg [2:0] count;

    always@( posedge clk )begin
        
        count <= count + 3'd1;
    
    end

    assign clk_divided = count[2];

    All_Vio vio0( .clk(clk), .probe_in0(key_out), .probe_in1(data_out), .probe_out0(data), .probe_out1(key_input));
    
    AES_circuit a0( data_in, clk_divided, reset_in, key_out, data_out, sure);
    keygenerator k0( clk_divided, Reset, key_input, key_out, enable);
    //clk_1Hz c0(clk,clk_divided,Reset);
    
    always@(enable) begin
        
        if(enable) begin
            //data_in=128'h000102030405060708090a0b0c0d0e0f; 
            data_in = data;
        end
        
        else begin
            data_in = 128'd0;
        end

    end
    
    /*always@(counter) begin

        case(counter)
            6'd0 :led=key_out[127:120]; 
            6'd1 :led=key_out[119:112]; 
            6'd2 :led=key_out[111:104]; 
            6'd3 :led=key_out[103:96];  
            6'd4 :led=key_out[95:88];   
            6'd5 :led=key_out[87:80];   
            6'd6 :led=key_out[79:72];   
            6'd7 :led=key_out[71:64];   
            6'd8 :led=key_out[63:56];   
            6'd9 :led=key_out[55:48];   
            6'd10:led=key_out[47:40];   
            6'd11:led=key_out[39:32];   
            6'd12:led=key_out[31:24];   
            6'd13:led=key_out[23:16];   
            6'd14:led=key_out[15:8];    
            6'd15:led=key_out[7:0];   
            6'd18:led=data_out[127:120]; 
            6'd19:led=data_out[119:112]; 
            6'd20:led=data_out[111:104]; 
            6'd21:led=data_out[103:96];  
            6'd22:led=data_out[95:88];   
            6'd23:led=data_out[87:80];   
            6'd24:led=data_out[79:72];   
            6'd25:led=data_out[71:64];   
            6'd26:led=data_out[63:56];   
            6'd27:led=data_out[55:48];   
            6'd28:led=data_out[47:40];   
            6'd29:led=data_out[39:32];   
            6'd30:led=data_out[31:24];   
            6'd31:led=data_out[23:16];   
            6'd32:led=data_out[15:8];    
            6'd33:led=data_out[7:0];     
            default:led=8'b10101010;
        endcase

    end
    
    always@(posedge clk_divided or negedge reset) begin

        if(reset==1'b0 || sure==1'b0) begin
            counter<=6'd0; 
        end
        
        else begin
            counter<=counter+6'd1; 
        end

    end*/

endmodule
