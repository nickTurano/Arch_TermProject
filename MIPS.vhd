library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MIPS is
  port(
    clk: in bit
  );

architecture structure of MIPS is
  component Inst_Mem is
    port (
      address: in STD_LOGIC_VECTOR (31 downto 0);
      read_data: out STD_LOGIC_VECTOR (31 downto 0)
      );
  end component;

  component add is
    port(
      x, y: in STD_LOGIC_VECTOR(31 downto 0);
      z: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component 32Bit_2x1mux is
    port(
      x, y: in STD_LOGIC_VECTOR(31 downto 0);
      sel: in bit;
      z: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component 5Bit_2x1mux is
    port(
      x, y: in STD_LOGIC_VECTOR(5 downto 0);
      sel: in bit;
      z: out STD_LOGIC_VECTOR(5 downto 0)
    );
  end component;

  component Control is
    port(
      inst: in STD_LOGIC_VECTOR(5 downto 0);
      RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOP1, ALUOP2: out bit;
    );
  end component;

  component Data_Mem is
    port (
      address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
      MemWrite, MemRead,ck: in STD_LOGIC;
      read_data: out STD_LOGIC_VECTOR (31 downto 0)
    );
  end component;

  component ALU is
    port(
      src1, src2: in STD_LOGIC_VECTOR(31 downto 0);
      OP: in STD_LOGIC_VECTOR(3 downto 0);
      result: out STD_LOGIC_VECTOR(31 downto 0);
      zero: out bit;
    );
  end component;

  component Registers is
    port(
      read_reg_1, read_reg_2, write_reg: in STD_LOGIC_VECTOR(5 downto 0);
      write_data: in STD_LOGIC_VECTOR(31 downto 0);
      RegWrite: in bit;
      read_data_1, read_data_2: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

component Sign_Entender is
  port(
    x: in STD_LOGIC_VECTOR(15 downto 0);
    y: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

component ALU_Control is
  port(
    inst: in STD_LOGIC_VECTOR(5 downto 0);
    OP1, OP2: in bit;
    ALU_Inst: out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;

  signal pc, instruction, Write_data, ReadData1, ReadData2, inst_extd, ALU_Input, ALU_Result, memory_data, memory_result: STD_LOGIC_VECTOR(31 downto 0);
  signal RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOP1, ALUOP2, zero: out bit;
  signal Write_Register STD_LOGIC_VECTOR(5 downto 0);
  signal ALUInst: STD_LOGIC_VECTOR(3 downto 0);
  begin
    Instruction_Memory: Inst_Mem port map(address=>pc, instruction=>instruction);
    Control_Unit: Control port map(inst=>instruction(31 downto 26), RegDst=>RegDst, Jump=>Jump, MemRead=>MemRead, MemtoReg=>MemtoReg, MemWrite=?MemWrite, ALUSrc=>ALUSrc, RegWrite=>RegWrite, ALUOP1=>ALUOP1, ALUOP2=>ALUOP2);
    5BMux1: 5Bit_2x1mux port map(x=>instruction(20 downto 16), y=>instruction(15 downto 11), sel=>RegDst, z=>Write_Register);
    Registers: Registers port map(read_reg_1=>instruction(25 downto 21), read_reg_2=>instruction(20 downto 16), write_reg=>Write_Register, write_data=>Write_data, RegWrite=>RegWrite, read_data_1=>ReadData1, read_data_2=>ReadData2);
    S1: Sign_Entender port map(x=>instruction(15 downto 0), y=>inst_extd);
    ALUControl: ALU_Control port map(inst=>instruction(5 downto 0), OP1=>ALUOP1, OP2=>ALUOP2, ALU_Inst=>ALUInst);
    32BMux1: 32Bit_2x1mux port map(x=>ReadData2, y=>inst_extd, sel=>ALUSrc, z=>ALU_Input);
    ALU: ALU port map(src1=>ReadData1, src2=>Alu_Input, OP=>ALUInst, result=>ALU_Result, zero=>zero);
    Data_Memory: data_mem port map(address=>ALU_Result, write_date=>ReadData2, MemWrite=>MemWrite, MemRead=>MemRead, ck=>clk, read_data=>memory_data);
    32BMux2: 32Bit_2x1mux port map(x=>ALU_Result, y=>memory_data, sel=>MemtoReg, z=>memory_result);
