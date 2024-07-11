`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 14:54:37
// Design Name: 
// Module Name: FIFO
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


module FIFO(
       input clk,reset,
       input [7:0] w_data,
       output [7:0] r_data,
       input rd, wr,
       output full, empty
       );
    wire [2:0] r_addr, w_addr;
    wire w_en;
    
    register_file  REG( clk,r_addr,w_addr, w_data,r_data,  w_en) ;
     
    fifo_controller  CONTROLLER( clk, reset, wr, rd, full, empty, w_addr,r_addr,w_en);
     
endmodule
