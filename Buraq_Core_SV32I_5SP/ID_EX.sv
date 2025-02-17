`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2020 04:51:25 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX #(
parameter DataWidth = 32,
parameter RegAddrWidth = 5
)
(
    input clock,
    input reset,
    input [DataWidth-1:0]PC_IN,
    input [DataWidth-1:0]readData1_IN,
    input [DataWidth-1:0]readData2_IN,
    input [DataWidth-1:0]Immediate_IN,    
    input [1:0]Operand_A_sel_IN,
    input      Operand_B_sel_IN,
    input      Mem_READ_IN,
    input      Mem_to_Reg_IN,
    input      Mem_Write_IN,
    input [2:0]ALU_OP_IN,
    input [2:0]Func_3_IN,
    input [1:0]Func_7_IN,
    input      reg_EN_IN,
    input [RegAddrWidth-1:0]writeBackReg_IN,
    input [RegAddrWidth-1:0]Src1_IN,
    input [RegAddrWidth-1:0]Src2_IN,
    input [DataWidth-1:0]Mem_Data_IN,
    
    output logic [DataWidth-1:0]PC_OUT,
    output logic [DataWidth-1:0]readData1_OUT,
    output logic [DataWidth-1:0]readData2_OUT,
    output logic [DataWidth-1:0]Immediate_OUT,
    output logic [1:0]Operand_A_sel_OUT,
    output logic Operand_B_sel_OUT,
    output logic Mem_READ_OUT,
    output logic Mem_to_Reg_OUT,
    output logic Mem_Write_OUT,
    output logic [2:0]ALU_OP_OUT,
    output logic [2:0]Func_3_OUT,
    output logic [1:0]Func_7_OUT,
    output logic reg_EN_OUT,
    output logic [RegAddrWidth-1:0]writeBackReg_OUT,
    output logic [RegAddrWidth-1:0]Src1_OUT,
    output logic [RegAddrWidth-1:0]Src2_OUT,
    output logic [DataWidth-1:0]Mem_Data_OUT
);

always @(posedge clock)begin
    if (reset)begin
         PC_OUT            <= 32'd0;
         readData1_OUT     <= 32'd0;
         readData2_OUT     <= 32'd0;
         Immediate_OUT     <= 32'd0;
         Operand_A_sel_OUT <= 2'd0;
         Operand_B_sel_OUT <= 1'b0;
         Mem_READ_OUT      <= 1'b0;
         Mem_to_Reg_OUT    <= 1'b0;
         Mem_Write_OUT     <= 1'b0;
         ALU_OP_OUT        <= 3'd0;
         Func_3_OUT        <= 3'd0;
         Func_7_OUT        <= 2'b0;
         reg_EN_OUT        <= 1'b0;
         writeBackReg_OUT  <= 5'b0; 
         Src1_OUT          <= 5'b0;
         Src2_OUT          <= 5'b0;
         Mem_Data_OUT      <= 32'b0;
    end
    else begin
        PC_OUT            <= PC_OUT;
        ALU_OP_OUT        <= ALU_OP_IN;
        Func_3_OUT        <= Func_3_IN;
        Func_7_OUT        <= Func_7_IN;
        reg_EN_OUT        <= reg_EN_IN;
        Mem_READ_OUT      <= Mem_READ_IN;
        readData1_OUT     <= readData1_IN;
        readData2_OUT     <= readData2_IN;
        Immediate_OUT     <= Immediate_IN;
        Mem_Write_OUT     <= Mem_Write_IN;
        Mem_to_Reg_OUT    <= Mem_to_Reg_IN;
        writeBackReg_OUT  <= writeBackReg_IN;
        Operand_A_sel_OUT <= Operand_A_sel_IN;
        Operand_B_sel_OUT <= Operand_B_sel_IN;
        Src1_OUT          <= Src1_IN;
        Src2_OUT          <= Src2_IN;
        Mem_Data_OUT      <= Mem_Data_IN;
    end
end
endmodule: ID_EX