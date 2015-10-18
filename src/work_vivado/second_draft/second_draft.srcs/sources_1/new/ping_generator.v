`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2015 06:50:49 PM
// Design Name: 
// Module Name: ping_generator
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


module ping_generator(
    output [7:0] data,
    input ready,
    input rst_n,
    output valid,
    output done
    );
    
    wire [7:0] data;
    wire ready, valid, done, rst_n;
    wire [50 * 8 - 1:0] pingHdr;
    wire [48 * 8 - 1:0] pingData;
    reg [6:0] index, index_next;
    assign pingHdr = 50'h80e6500574aa001f2641f000080045000054282040003d012f5780023a6f80edaad30800a44b0233001bc124245600000000;
    assign pingData = 48'ha0180d0000000000101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f3031323334353637;
    
     
    always @(*) begin
        index_next = index + 1;
    end 
    
    always @(posedge ready or negedge rst_n) begin
        if(~rst_n)
            index <= 0;
        else begin
            index <= index_next;
            if(index < 50)
                data <= pingHdr[8*index +: 8];
            else
                data <= pingData[8*(index - 50) +: 8];
            if(index == 97)
                index <= 0;
        end
    end     
    
    assign valid = 1'b1;
    assign done = (index == 97);
    
endmodule