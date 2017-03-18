library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pc is
component pc is
  port(
    A: in STD_LOGIC_VECTOR(31 downto 0);
    Z: out STD_LOGIC_VECTOR(31 downto 0)
  );

architecture behav of pc is
  begin
    process(A)
    begin
      Z <= A;
    end process;
  end behav;
