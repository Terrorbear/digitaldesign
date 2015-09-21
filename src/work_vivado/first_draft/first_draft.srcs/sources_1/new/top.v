`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2015 11:40:29 AM
// Design Name: 
// Module Name: top
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
/////////////////////////////////////////////////////////////////////////////////

`define PACKET_LEN 32
`define PACKET_BYTES 4

module top(
    input clk,
    input button,
    input rst,
    output lcd
    );
    
    wire gen_signal, rst_b;
    wire [31:0] next_addr;
      
    assign rst_b = ~rst;
      
    always @(posedge button or negedge rst_b) begin
        if(~rst_b)
            next_addr = {32{1'b0}};
        else begin
            next_addr = next_addr + PACKET_BYTES;
        end
    end
    
    fake_input input_gen(.gen (button),
                         .outgen (gen_signal));
                         
    traffic_generator t_gen(.gen_signal (gen_signal),
                            .addr (next_addr),
                            .p_data (mem_w_data));
                            
    
endmodule
