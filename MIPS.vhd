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

  component 2x1mux is
    port(
      x, y: in STD_LOGIC_VECTOR(31 downto 0);
      sel: in bit;
      z: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component Control is
    port(
      inst: in STD_LOGIC_VECTOR(5 downto 0);
      RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite: out bit;
      ALUOp: out STD_LOGIC_VECTOR(1 downto 0)
    );
  end component;

  component Data_Mem is
    port (
      address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
      MemWrite, MemRead,ck: in STD_LOGIC;
      read_data: out STD_LOGIC_VECTOR (31 downto 0)
    );

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
      read_data_1, read_data_2: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;
