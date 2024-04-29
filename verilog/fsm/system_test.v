`timescale 1ns / 1ps

module system_test ();
    wire [3:0] first_data_out;
    wire [3:0] second_data_out;

    reg confirm;
    reg [3:0] data_in;
    reg request;
    reg clock;
    
    system uut (
        .first_data_out(first_data_out),
        .second_data_out(second_data_out),
        .confirm(confirm),
        .data_in(data_in),
        .request(request),
        .clock(clock)
    );

    initial
    begin
        clock = 0;
        repeat (100)
            #40 clock = ~clock;
    end

    initial
    begin
        request = 1;
        #200
        
        confirm = 1;
        data_in = 4'b0110;
        #200;

        data_in = 4'b0111;
        #100;

        request = 0;
        #50;

        request = 1;
        #50;
        
        data_in = 4'b0110;
        confirm = 1;
        #100;
        
        data_in = 4'b0111;
        #50;
        
        
    end
endmodule

