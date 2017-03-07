library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity ALU is
  port(
    src1, src2: in STD_LOGIC_VECTOR(31 downto 0);
    OP: in STD_LOGIC_VECTOR(3 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0);
    zero: out bit;
  );
end ALU;

architecture behav of ALU is
begin
    case OP is
      when 0000 => result <= src1 and src2;
      when 0001 => result <= src1 or src2;
      when 0100 => result <= src1 + src2;
      when 0101 => result <= src1 - src2;
      when 0111 => if(src1 - src2 < 0){ result <= 1;}else{result <= 0;}
      zero <= 0;
end behav;
