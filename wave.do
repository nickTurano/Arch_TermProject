onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips/clk
add wave -noupdate /mips/pc_current
add wave -noupdate /mips/instruction
add wave -noupdate /mips/Write_data
add wave -noupdate /mips/ReadData1
add wave -noupdate /mips/ReadData2
add wave -noupdate /mips/inst_extd
add wave -noupdate /mips/ALU_Input
add wave -noupdate /mips/ALU_Result
add wave -noupdate /mips/memory_data
add wave -noupdate /mips/memory_result
add wave -noupdate /mips/pc_plus
add wave -noupdate /mips/branch_offset
add wave -noupdate /mips/branch_addr
add wave -noupdate /mips/jump_addr
add wave -noupdate /mips/branch_mux
add wave -noupdate /mips/pc_next
add wave -noupdate /mips/RegDst
add wave -noupdate /mips/Jump
add wave -noupdate /mips/Branch
add wave -noupdate /mips/MemRead
add wave -noupdate /mips/MemtoReg
add wave -noupdate /mips/MemWrite
add wave -noupdate /mips/ALUSrc
add wave -noupdate /mips/RegWrite
add wave -noupdate /mips/zero
add wave -noupdate /mips/branch_sel
add wave -noupdate /mips/Write_Register
add wave -noupdate /mips/ALUInst
add wave -noupdate /mips/ALUOP_A
add wave -noupdate /mips/Instruction_Memory/address
add wave -noupdate /mips/Instruction_Memory/read_data
add wave -noupdate /mips/Instruction_Memory/inst_mem
add wave -noupdate /mips/Control_Unit/inst
add wave -noupdate /mips/Control_Unit/RegDst
add wave -noupdate /mips/Control_Unit/Jump
add wave -noupdate /mips/Control_Unit/Branch
add wave -noupdate /mips/Control_Unit/MemRead
add wave -noupdate /mips/Control_Unit/MemtoReg
add wave -noupdate /mips/Control_Unit/MemWrite
add wave -noupdate /mips/Control_Unit/ALUSrc
add wave -noupdate /mips/Control_Unit/RegWrite
add wave -noupdate /mips/Control_Unit/ALUOP
add wave -noupdate /mips/Control_Unit/cntl_vector
add wave -noupdate /mips/B5Mux1/d0
add wave -noupdate /mips/B5Mux1/d1
add wave -noupdate /mips/B5Mux1/sel
add wave -noupdate /mips/B5Mux1/Z
add wave -noupdate /mips/Reg_Files/read_reg_1
add wave -noupdate /mips/Reg_Files/read_reg_2
add wave -noupdate /mips/Reg_Files/write_reg
add wave -noupdate /mips/Reg_Files/write_data
add wave -noupdate /mips/Reg_Files/RegWrite
add wave -noupdate /mips/Reg_Files/read_data_1
add wave -noupdate /mips/Reg_Files/read_data_2
add wave -noupdate -expand /mips/Reg_Files/reg_mem
add wave -noupdate /mips/S1/A
add wave -noupdate /mips/S1/Z
add wave -noupdate /mips/ALUControl/funct
add wave -noupdate /mips/ALUControl/ALUOP
add wave -noupdate /mips/ALUControl/ALUControl
add wave -noupdate /mips/B32Mux1/d0
add wave -noupdate /mips/B32Mux1/d1
add wave -noupdate /mips/B32Mux1/sel
add wave -noupdate /mips/B32Mux1/Z
add wave -noupdate /mips/ALU1/src1
add wave -noupdate /mips/ALU1/src2
add wave -noupdate /mips/ALU1/ALUcontrol
add wave -noupdate /mips/ALU1/result
add wave -noupdate /mips/ALU1/zero
add wave -noupdate /mips/ALU1/res_buff
add wave -noupdate /mips/Data_Memory/address
add wave -noupdate /mips/Data_Memory/write_data
add wave -noupdate /mips/Data_Memory/MemWrite
add wave -noupdate /mips/Data_Memory/MemRead
add wave -noupdate /mips/Data_Memory/ck
add wave -noupdate /mips/Data_Memory/read_data
add wave -noupdate -expand /mips/Data_Memory/data_mem
add wave -noupdate /mips/B32Mux2/d0
add wave -noupdate /mips/B32Mux2/d1
add wave -noupdate /mips/B32Mux2/sel
add wave -noupdate /mips/B32Mux2/Z
add wave -noupdate /mips/adder1/X
add wave -noupdate /mips/adder1/Y
add wave -noupdate /mips/adder1/Z
add wave -noupdate /mips/sl1/A
add wave -noupdate /mips/sl1/Z
add wave -noupdate /mips/adder2/X
add wave -noupdate /mips/adder2/Y
add wave -noupdate /mips/adder2/Z
add wave -noupdate /mips/sl2/A
add wave -noupdate /mips/sl2/Z
add wave -noupdate /mips/B32Mux3/d0
add wave -noupdate /mips/B32Mux3/d1
add wave -noupdate /mips/B32Mux3/sel
add wave -noupdate /mips/B32Mux3/Z
add wave -noupdate /mips/B32Mux4/d0
add wave -noupdate /mips/B32Mux4/d1
add wave -noupdate /mips/B32Mux4/sel
add wave -noupdate /mips/B32Mux4/Z
add wave -noupdate /mips/PC1/A
add wave -noupdate /mips/PC1/ck
add wave -noupdate /mips/PC1/Z
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 287
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1106 ns}
