library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity add is
  Port(
    X,Y: in STD_LOGIC_VECTOR(31 downto 0);
    Z: out STD_LOGIC_VECTOR(31 downto 0)
  );
  End;

architecture behav of add is
  begin
    Z <= X+Y;
  end;
  
