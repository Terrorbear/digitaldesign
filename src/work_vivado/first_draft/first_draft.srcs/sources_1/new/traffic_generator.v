`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2015 10:55:57 AM
// Design Name: 
// Module Name: traffic_generator
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


module traffic_generator(
    input gen_signal,
    input [31:0] addr,
    output [31:0] p_data
    );
    
    always @(posedge gen_signal)
        p_data = addr;
    
endmodule
