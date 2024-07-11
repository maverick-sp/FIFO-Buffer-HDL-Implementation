`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 16:38:52
// Design Name: 
// Module Name: controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller_tb();

    reg clk, reset;
    reg wr, rd;
    wire full, empty;
    wire [2:0] w_addr, r_addr;
    wire w_en;

    // Instantiate Unit Under Test
    fifo_controller uut(
        .clk(clk), 
        .reset(reset), 
        .wr(wr), 
        .rd(rd), 
        .full(full), 
        .empty(empty), 
        .w_addr(w_addr), 
        .r_addr(r_addr), 
        .w_en(w_en)
    );

    // Create a clock
    localparam T = 10;
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end

    // Generate stimuli using initial
    initial begin
        reset = 1'b1; wr = 0; rd = 0;
        #20; // Ensure reset pulse width
        reset = 1'b0;
        #10;

        // Write to FIFO
        wr = 1; rd = 0; #10;
        wr = 1; rd = 0; #10;
        wr = 1; rd = 0; #10;
        wr = 1; rd = 0; #10;
        wr = 1; rd = 0; #10;
        wr = 1; rd = 0; #10;
        wr = 1; rd = 0; #10;
        wr = 1; rd = 0; #10;

        // Stop writing and start reading from FIFO
        wr = 0; rd = 1; #10;
        rd = 1; #10;
        rd = 1; #10;
        rd = 1; #10;
        rd = 1; #10;
        rd = 1; #10;
        rd = 1; #10;
        rd = 1; #10;
        rd = 1; #10;

        $stop;
    end

endmodule

