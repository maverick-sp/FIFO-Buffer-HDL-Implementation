`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 12:47:25
// Design Name: 
// Module Name: fifo_controller
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


module fifo_controller(
   input clk, reset,
   input wr, rd,
   output reg full, empty,
   output [2:0] w_addr, r_addr,
   output w_en
);
    reg [2:0] w_ptr, r_ptr;
    reg [2:0] w_ptr_next, r_ptr_next;
    reg full_next, empty_next;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            w_ptr <= 0;
            r_ptr <= 0;
            full <= 1'b0;
            empty <= 1'b1;
        end else begin
            w_ptr <= w_ptr_next;
            r_ptr <= r_ptr_next;
            full <= full_next;
            empty <= empty_next;
        end
    end

    always @(*) begin
        w_ptr_next = w_ptr;
        r_ptr_next = r_ptr;
        full_next = full;
        empty_next = empty;

        case ({wr, rd})
            2'b01: // Read
                if (~empty) begin
                    r_ptr_next = r_ptr + 1;
                    full_next = 1'b0;
                    if (r_ptr_next == w_ptr)
                        empty_next = 1'b1;
                end
            2'b10: // Write
                if (~full) begin
                    w_ptr_next = w_ptr + 1;
                    empty_next = 1'b0;
                    if (w_ptr_next == r_ptr)
                        full_next = 1'b1;
                end
            2'b11: // Write and Read Simultaneously
                if (~full && ~empty) begin
                    w_ptr_next = w_ptr + 1;
                    r_ptr_next = r_ptr + 1;
                end
            default: begin
                w_ptr_next = w_ptr;
                r_ptr_next = r_ptr;
                full_next = full;
                empty_next = empty;
            end
        endcase
    end

    assign w_addr = w_ptr;
    assign r_addr = r_ptr;
    assign w_en = wr & (~full);

endmodule

