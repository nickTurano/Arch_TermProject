library IEEE;
use IEEE.std_logic_1164.all;

entity 32Bit_2x1mux is
  port(
    d0, d1: in STD_LOGIC_VECTOR(31 downto 0);
    S: in std_logic;
    Z: out STD_LOGIC_VECTOR(31 downto 0)
  );
end;

architecture behav of 32Bit_2x1mux is
  begin
    Z <= d0 when S = '0' else d1;
  end;
