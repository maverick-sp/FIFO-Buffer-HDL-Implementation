`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 15:17:53
// Design Name: 
// Module Name: FIFO_tb
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
module FIFO_tb();
    // Declaring all reg and wire identifiers
    reg clk, reset, rd, wr;
    reg [7:0] w_data;
    wire [7:0] r_data;
    wire full, empty;
    
    // Instantiate unit under test
    FIFO uut(clk, reset, w_data, r_data, rd, wr, full, empty);
    
    // Create a clock
    localparam T = 20;
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    // Monitor to observe signals
    initial begin
        $monitor("Time: %0d, wr: %b, rd: %b, w_data: %h, r_data: %h, full: %b, empty: %b", $time, wr, rd, w_data, r_data, full, empty);
    end
    
    // Generating Stimuli using initial 
    initial begin
        // Initial state
        reset = 1'b1; wr = 1'b0; rd = 1'b0; w_data = 8'd0;
        #20;
        
        // Deassert reset
        reset = 1'b0;
        
        // Write operations
        wr = 1'b1;
        w_data = 8'd20; #20;
        w_data = 8'd10; #20;
        w_data = 8'd12; #20;
        w_data = 8'd11; #20;
        w_data = 8'd9;  #20;
        w_data = 8'd8;  #20;
        w_data = 8'd7;  #20;
        w_data = 8'd6;  #20;
        
        // Stop writing and start reading
        wr = 1'b0;
        rd = 1'b1;
        #200; // Read for 8 clock cycles
        
        // Stop simulation
        $stop;
    end
endmodule

