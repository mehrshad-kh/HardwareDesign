`timescale 1ns / 1ps

module fsm (
    data_out, 
    first_output_enable, 
    second_output_enable, 
    confirm, 
    data_in, 
    request, 
    clock
);
    output reg [3:0] data_out;
    output reg first_output_enable;
    output reg second_output_enable;
    input confirm;
    input [3:0] data_in;
    input request;
    input clock;
    
    parameter idle = 3'b000;
    parameter active = 3'b001;
    parameter logged_in = 3'b101;
    parameter store = 3'b110;
    parameter trap = 3'b111;
    
    reg [2:0] state;
    
    initial
    begin
        state = idle;
    end

    always @ (posedge clock)
    begin
        if (request == 0) 
            state = idle;
    end
       
    always @ (posedge clock)
    begin
        case (state)
            idle: 
                if (request == 1) 
                    state = active;
            active: 
                if (confirm == 1) 
                    if (data_in == 4'b0110) 
                        state = logged_in;
                    else 
                        state = trap;
            logged_in:
                if (confirm == 1) 
                    state = store;
        endcase
        // end
    end
    
    always @ (state)
    begin
        if (state == store)
        begin
            data_out = data_in;
            
            if (data_in[0] == 0)
            begin
                first_output_enable = 0;
                second_output_enable = 1;
            end
            else
            begin
                first_output_enable = 1;
                second_output_enable = 0;
            end
        end
        else
        begin
            first_output_enable = 0;
            second_output_enable = 0;
        end
    end
endmodule
