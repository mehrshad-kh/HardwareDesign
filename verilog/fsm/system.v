`timescale 1ns / 1ps

module system (
    first_data_out,
    second_data_out,
    confirm,
    data_in,
    request,
    clock
);
    output [3:0] first_data_out;
    output [3:0] second_data_out;
    input confirm;
    input [3:0] data_in;
    input request;
    input clock;

    wire first_enable;
    wire second_enable;
    wire [3:0] data;

    register first_register (
        .out(first_data_out),
        .enable(first_enable),
        .in(data),
        .clock(clock)
    );

    register second_register (
        .out(second_data_out),
        .enable(second_enable),
        .in(data),
        .clock(clock)
    );

    fsm my_fsm (
        .data_out(data),
        .first_output_enable(first_enable),
        .second_output_enable(second_enable),
        .confirm(confirm),
        .data_in(data_in),
        .request(request),
        .clock(clock)
    );
endmodule

