`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2020 12:50:54 PM
// Design Name: 
// Module Name: Forwarding_Unit
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


module Forwarding_Unit#
(
parameter DataWidth = 32, 
parameter RegAddrWidth = 5
)
(   
    input Reg_File_EN_Memory_stage,
    input Reg_File_EN_WrBk_stage,
    input Reg_File_EN_EXE_stage,
    input Mem_Read_EN,
    input [RegAddrWidth-1:0]WriteBack_reg_Memory_stage,
    input [RegAddrWidth-1:0]WriteBack_reg_WrBk_stage,
    input [RegAddrWidth-1:0]WriteBack_reg_EXE_stage,
    input [RegAddrWidth-1:0]ID_EX_RS1,
    input [RegAddrWidth-1:0]ID_EX_RS2,
    
    output logic [2:0]Operand_A_control,
    output logic [2:0]Operand_B_control   
);

always_comb begin
    if((WriteBack_reg_Memory_stage == ID_EX_RS1) && (Reg_File_EN_Memory_stage == 1'b1) && (Mem_Read_EN == 1'b0))
        Operand_A_control = 3'b001;
    else
    if ((WriteBack_reg_Memory_stage == ID_EX_RS1) && (Reg_File_EN_Memory_stage == 1'b1) && (Mem_Read_EN == 1'b1))
        Operand_A_control = 3'b110;
    else
    if ((WriteBack_reg_WrBk_stage == ID_EX_RS1) && Reg_File_EN_WrBk_stage == 1'b1)
        Operand_A_control = 3'b010;
    else
    if ((WriteBack_reg_EXE_stage == ID_EX_RS1) && Reg_File_EN_EXE_stage == 1'b1)
        Operand_A_control = 3'b011;
    else
        Operand_A_control = 3'b000;
end


always_comb begin
    if((WriteBack_reg_Memory_stage == ID_EX_RS2) && (Reg_File_EN_Memory_stage == 1'b1) && (Mem_Read_EN == 1'b0))
        Operand_B_control = 3'b001;
    else
    if ((WriteBack_reg_Memory_stage == ID_EX_RS2) && (Reg_File_EN_Memory_stage == 1'b1) && (Mem_Read_EN == 1'b1))
        Operand_B_control = 3'b110;
    else
    if ((WriteBack_reg_WrBk_stage == ID_EX_RS2) && Reg_File_EN_WrBk_stage == 1'b1)
        Operand_B_control = 3'b010;
    else
    if ((WriteBack_reg_EXE_stage == ID_EX_RS2) && Reg_File_EN_EXE_stage == 1'b1)
            Operand_B_control = 3'b011;
    else
        Operand_B_control = 3'b000;
end

endmodule: Forwarding_Unit
