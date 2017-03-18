library ieee;
use ieee.std_logic_1164.all;

entity 32shiftl2 is
  Port(
    A: in STD_LOGIC_VECTOR(32 downto 0);
    Z: in STD_LOGIC_VECTOR(32 downto 0)
  );

architecture behav of 32shiftl2 is
  begin
    Y <= A(29 downto 0) & "00"
end;
