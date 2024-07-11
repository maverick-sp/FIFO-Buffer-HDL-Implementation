`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 12:22:00
// Design Name: 
// Module Name: register_file
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


module register_file(
   input clk,
   input [2:0] r_addr,w_addr,
   input[7:0] w_data,
   output [7:0] r_data,
   input w_en
   );
   reg [7:0] memory [0:7];
   
   always @(posedge clk) 
   begin 
   if(w_en)
   memory[w_addr]<=w_data; // Synchronous write
   end
   
   assign r_data=memory[r_addr]; // Asynchronous Read as we are implementing FWFT FIFO
   
endmodule
