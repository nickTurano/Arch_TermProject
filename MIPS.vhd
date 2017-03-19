library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MIPS is
  port(
    clk: in std_logic
  );
end;
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

  component Bit32_2x1mux is
    port(
      d0, d1: in STD_LOGIC_VECTOR(31 downto 0);
      sel: in std_logic;
      z: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component Bit5_2x1mux is
    port(
      d0, d1: in STD_LOGIC_VECTOR(4 downto 0);
      sel: in std_logic;
      z: out STD_LOGIC_VECTOR(4 downto 0)
    );
  end component;

  component Control is
    port(
      inst: in STD_LOGIC_VECTOR(5 downto 0);
      RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite: out STD_LOGIC;
      ALUOP: out STD_LOGIC_VECTOR(1 downto 0)
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
    ALUcontrol: in STD_LOGIC_VECTOR(2 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0);
    zero: out std_logic
  );
  end component;

  component Registers is
    port(
      read_reg_1, read_reg_2, write_reg: in STD_LOGIC_VECTOR(4 downto 0);
      write_data: in STD_LOGIC_VECTOR(31 downto 0);
      RegWrite: in std_logic;
      read_data_1, read_data_2: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

component Sign_Extender is
  port(
	A: in std_logic_vector(15 downto 0);
	Z: out std_logic_vector(31 downto 0)
);
end component;

component ALU_Control is
  port(
    funct: in STD_LOGIC_VECTOR(5 downto 0);
    ALUOP: in STD_LOGIC_VECTOR(1 downto 0);
    ALUControl: out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;

component shiftleft2_32b is
  Port(
    A: in STD_LOGIC_VECTOR(31 downto 0);
    Z: out STD_LOGIC_VECTOR(31 downto 0)
  );

end component;

component shiftleft2_26b is 
	Port(
    		A: in STD_LOGIC_VECTOR(25 downto 0);
    		Z: out STD_LOGIC_VECTOR(27 downto 0)
  	);	
end component;

component pc is
	port(
    	A: in STD_LOGIC_VECTOR(31 downto 0);
    	ck: in std_logic;    
    	Z: out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;


  signal pc_current, instruction, Write_data, ReadData1, ReadData2, inst_extd, ALU_Input, ALU_Result, memory_data, memory_result, pc_plus, branch_offset, branch_addr, jump_addr, branch_mux, pc_next: STD_LOGIC_VECTOR(31 downto 0);
  signal RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero, branch_sel: std_logic;
  signal Write_Register : STD_LOGIC_VECTOR(4 downto 0);
  signal ALUInst: STD_LOGIC_VECTOR(2 downto 0);
  signal ALUOP_A: STD_LOGIC_VECTOR(1 downto 0);
  begin
	Instruction_Memory: Inst_Mem port map(address=>pc_current, read_data=>instruction);
    	Control_Unit: Control port map(inst=>instruction(31 downto 26), RegDst=>RegDst, Jump=>Jump, Branch => Branch, MemRead=>MemRead, MemtoReg=>MemtoReg, MemWrite=>MemWrite, ALUSrc=>ALUSrc, RegWrite=>RegWrite, ALUOP=>ALUOP_A);
    	B5Mux1: Bit5_2x1mux port map(d0=>instruction(20 downto 16), d1=>instruction(15 downto 11), sel=>RegDst, z=>Write_Register);
    	Reg_Files: Registers port map(read_reg_1=>instruction(25 downto 21), read_reg_2=>instruction(20 downto 16), write_reg=>Write_Register, write_data=>memory_data, RegWrite=>RegWrite, read_data_1=>ReadData1, read_data_2=>ReadData2);
    	S1: Sign_Extender port map(A=>instruction(15 downto 0), Z=>inst_extd);
    	ALUControl: ALU_Control port map(funct=>instruction(5 downto 0), ALUOP => ALUOP_A, ALUControl=>ALUInst);
    	B32Mux1: Bit32_2x1mux port map(d0=>ReadData2, d1=>inst_extd, sel=>ALUSrc, z=>ALU_Input);
    	ALU1: ALU port map(src1=>ReadData1, src2=>Alu_Input, ALUControl =>ALUInst, result=>ALU_Result, zero=>zero);
    	Data_Memory: data_mem port map(address=>ALU_Result, write_data=>ReadData2, MemWrite=>MemWrite, MemRead=>MemRead, ck=>clk, read_data=>memory_data);
    	B32Mux2: Bit32_2x1mux port map(d0=>ALU_Result, d1=>memory_data, sel=>MemtoReg, z=>memory_result);
    	adder1: add port map(x=>pc_current, y=>"00000000000000000000000000000100", z=>pc_plus);
	sl1: shiftleft2_32b port map(A => inst_extd, Z => branch_offset);
	adder2: add port map(x=> pc_plus, y=>branch_offset, z=> branch_addr);
	sl2: shiftleft2_26b port map(A => instruction(25 downto 0), Z => jump_addr(27 downto 0));
	jump_addr(31 downto 28)<= pc_plus(31 downto 28);
	branch_sel <= (Branch AND zero);
	B32Mux3: Bit32_2x1mux port map(d0 => pc_plus, d1 => branch_addr, sel => branch_sel, z => branch_mux);
	B32Mux4: Bit32_2x1mux port map(d0 => branch_mux, d1 => jump_addr, sel => Jump, z => pc_next);
	PC1: pc port map(A => pc_next, ck => clk, Z => pc_current);
end structure;
	


