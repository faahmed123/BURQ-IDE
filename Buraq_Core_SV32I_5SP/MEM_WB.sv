`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2020 06:05:18 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB#(
parameter DataWidth = 32,
parameter RegAddrWidth = 5
)
(
    input clock,
    input reset,
    input RegEn_IN,
    input [DataWidth-1:0]ALU_result_IN,
    input [DataWidth-1:0]Mem_Data_IN,
    input [RegAddrWidth-1:0]WB_REG_IN,
    input Mem_to_Reg_IN,
    
    output logic RegEn_OUT,
    output logic [DataWidth-1:0]ALU_result_OUT,
    output logic [DataWidth-1:0]Mem_Data_OUT,
    output logic [RegAddrWidth-1:0]WB_REG_OUT,
    output logic Mem_to_Reg_OUT
 );

always @ (posedge clock)begin
    if (reset)begin
        ALU_result_OUT  <= 32'd0;
        Mem_Data_OUT    <= 32'd0;
        WB_REG_OUT      <= 5'd0;
        Mem_to_Reg_OUT  <= 1'b0;
        RegEn_OUT       <= 1'b0;      
    end
    else begin
        ALU_result_OUT  <= ALU_result_IN;
        Mem_Data_OUT    <= Mem_Data_IN;
        WB_REG_OUT      <= WB_REG_IN;
        Mem_to_Reg_OUT  <= Mem_to_Reg_IN;
        RegEn_OUT       <= RegEn_IN;
    end
end
endmodule: MEM_WB
