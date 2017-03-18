library ieee;
use ieee.std_logic_1164.all;

entity 26shiftl2 is
  Port(
    A: in STD_LOGIC_VECTOR(25 downto 0);
    Z: in STD_LOGIC_VECTOR(27 downto 0)
  );

architecture behav of 26shiftl2 is
  begin
    Y <= A & "00"
end;
