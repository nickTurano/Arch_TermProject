library IEEE;
use IEEE.std_logic_1164.all;

entity sign_extender is 
	port(
	A: in std_logic_vector(15 downto 0);
	Z: out std_logic_vector(31 downto 0)
);
end;

architecture behav of sign_extender is
	begin
		Z <= X"0000" & A when A(15) = '0' else X"ffff" & A;
	end;