`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2020 04:33:40 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID#(
parameter DataWidth = 32,
parameter RegAddrWidth = 5
)
(
    input clock,
    input reset,
    input flush,
    input [DataWidth-1:0]Instruction_IN,
    input [DataWidth-1:0]PC_IN,
    
    output logic [DataWidth-1:0]Instruction_OUT,
    output logic [DataWidth-1:0]PC_OUT
    );
    
    always@(posedge clock)begin
        if(flush)begin
            Instruction_OUT <= 32'd0;
            //PC_OUT <= 32'd0;
        end
	else if(reset)begin
	    Instruction_OUT <= 32'd0;
	    PC_OUT <= 32'd0;
	end
        else begin
            Instruction_OUT <= Instruction_IN;
            PC_OUT <= PC_IN;
        end    
    end
endmodule: IF_ID
