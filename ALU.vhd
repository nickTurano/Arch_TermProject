library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ALU is
  port(
    src1, src2: in STD_LOGIC_VECTOR(31 downto 0);
    ALUcontrol: in STD_LOGIC_VECTOR(2 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0);
    zero: out bit
  );
end ALU;

architecture behav of ALU is
begin
  process(ALUcontrol)
    case OP is
      when "000" => result <= (src1 AND src2);
      when "001" => result <= (src1 or src2);
      when "010" => result <= (src1 + src2);
      when "100" => result <= (src1 AND NOT src2);
      when "101" => result <= (src1 OR NOT src2);
      when "110" => result <= (src1 - src2);
      when "111" =>
        if(src1 < src2) then
          result <= 0000000000000000000000000000001;
        else
          result <= 0000000000000000000000000000000;
        end if;
      when others => NULL;
    end case;

    if result = 0 then
      zero <= '1';
    else
      zero <= 0;
    end if;
  end process;
end behav;
 
