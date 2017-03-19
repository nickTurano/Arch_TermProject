library IEEE;
use IEEE.std_logic_1164.all;

Entity ALU_Control is
  port(
    funct: in STD_LOGIC_VECTOR(5 downto 0);
    ALUOP: in STD_LOGIC_VECTOR(1 downto 0);
    ALUControl: out STD_LOGIC_VECTOR(2 downto 0));
  end;

Architecture Behav of ALU_Control is
  begin
    process(funct, ALUOP)
    begin
    case ALUOP is
      when "00" => ALUcontrol <= "010";
      when "01" => ALUcontrol <= "110";
      when others => case funct is
        when "100000" => ALUcontrol <= "010";
        when "100010" => ALUcontrol <= "110";
        when "100100" => ALUcontrol <= "000";
        when "100101" => ALUcontrol <= "001";
        when "101010" => ALUcontrol <= "111";
        when "100110" => ALUcontrol <= "100";
        when "101011" => ALUcontrol <= "111";

        when others => ALUcontrol <= "---";
      end case;
    end case;
  end process;
end;
