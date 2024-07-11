`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 16:00:37
// Design Name: 
// Module Name: register_tb
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


module register_tb();
    reg clk;
   reg [2:0] r_addr,w_addr;
   reg [7:0] w_data;
   wire [7:0] r_data;
   reg w_en ;
   
   
   register_file uut(clk,r_addr,w_addr,w_data,r_data,w_en);
   
  // Create a clock
     localparam T=5;
     always 
     begin
     clk=1'b1;
     #(T/2);
     clk=1'b0;
     #(T/2);
     end
     
    initial
     begin
      r_addr=0;
      w_en=1'b0;
      #20;
      w_en=1'b1;
      w_data='d20;
      w_addr='d0;
      #20;
      w_en=1'b1;
      w_data='d10;
      w_addr='d1;
      #20
      w_en=1'b1;
      w_addr='d2;
      w_data='d3;
      #20
      w_en=1'b0;
      w_addr='d2;
      w_data='d3;
      #40
      r_addr='d2;
      #10
      $stop;
      end
      
    
endmodule