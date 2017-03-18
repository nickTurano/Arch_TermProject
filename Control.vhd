library IEEE;
use IEEE.std_logic_1164.all;

Entity control is
  port(
    inst: in STD_LOGIC_VECTOR(5 downto 0);
    RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOP1, ALUOP2: out STD_LOGIC;
  );
Architecture behav of control is
  signal cntl_vector: STD_LOGIC_VECTOR(8 downto 0);
  begin
  process (inst) begin
    case inst is
      when "000000" => cntl_vector <= "110000010";
      when "100011" => cntl_vector <= "101001000";
      when "101011" => cntl_vector <= "001010000";
      when "000100" => cntl_vector <= "000100001";
      when "001000" => cntl_vector <= "101000000";
      when "000010" => cntl_vector <= "000000100";
      when "000011" => cntl_vector <= "100000001";
      when "001001" => cntl_vector <= "101000001";
      when others   => cntl_vector <= "---------";
    end case;
  end process;
RegWrite <= cntl_vector(8);
ReadDst <=cntl_vector(7);
ALUSrc <= cntl_vector(6);
Branch <= cntl_vector(5);
MemWrite <= cntl_vector(4);
MemtoReg <=cntl_vector(3);
jump <= cntl_vector(2);
ALUOP1 <= cntl_vector(1);
ALUOP2 <= cntl_vector(0);

end;
