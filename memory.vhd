------------------------------------------------------
-- ECEC 355 Computer Architecture
-- MIPS Single Cycle Datapath
-- Cem Sahin - 08/04/2009
-- modified 07/21/2015, 02/03/2017
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity data_mem is
	port (
		address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		MemWrite, MemRead, ck: in STD_LOGIC;
		read_data: out STD_LOGIC_VECTOR (31 downto 0)
	);
end data_mem;


architecture behavioral of data_mem is	  

type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

signal data_mem: mem_array := (
    X"00000000", -- initialize data memory
    X"00000000", -- mem 1
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000", -- mem 10 
    X"00000000", 
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",  
    X"00000000", -- mem 20
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000", -- mem 30
    X"00000000");

begin

read_data <= data_mem(conv_integer(address(6 downto 2))) when MemRead = '1';

mem_process: process(address, write_data)
begin

		if (MemWrite = '1') then
			data_mem(conv_integer(address(6 downto 2))) <= write_data;
		end if;

end process mem_process;

end behavioral;