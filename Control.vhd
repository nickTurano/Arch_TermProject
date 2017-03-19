library IEEE;
use IEEE.std_logic_1164.all;

Entity control is
  port(
    inst: in STD_LOGIC_VECTOR(5 downto 0);
    RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite: out STD_LOGIC;
    ALUOP: out STD_LOGIC_VECTOR(1 downto 0)
  );
end;
Architecture behav of control is
  signal cntl_vector : STD_LOGIC_VECTOR(9 downto 0);
  begin
  process (inst) begin
    case inst is
      when "000000" => cntl_vector <= "0110000010"; -- R - Type
      when "100011" => cntl_vector <= "1101001000"; -- lw
      when "101011" => cntl_vector <= "0001010000"; -- sw
      when "000100" => cntl_vector <= "0000100001"; -- beq
      when "001000" => cntl_vector <= "0101000000"; -- addi
      when "000010" => cntl_vector <= "0000000100"; -- j
      when "000011" => cntl_vector <= "0100000001"; -- jal
      when "001001" => cntl_vector <= "0101000001"; -- subi
      when others   => cntl_vector <= "----------";
    end case;
  end process;
MemRead <= cntl_vector(9);
RegWrite <= cntl_vector(8);
RegDst <=cntl_vector(7);
ALUSrc <= cntl_vector(6);
Branch <= cntl_vector(5);
MemWrite <= cntl_vector(4);
MemtoReg <=cntl_vector(3);
jump <= cntl_vector(2);
ALUOP <= cntl_vector(1 downto 0);

end;
