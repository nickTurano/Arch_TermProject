library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity registers is
  port(
    read_reg_1, read_reg_2, write_reg: in STD_LOGIC_VECTOR(4 downto 0);
    write_data: in STD_LOGIC_VECTOR(31 downto 0);
    RegWrite: in std_logic;
    read_data_1, read_data_2: out STD_LOGIC_VECTOR(31 downto 0)
  );
end registers;


architecture behavioral of registers is

type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

signal reg_mem: mem_array := (
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

read_data_1 <= reg_mem(conv_integer(read_reg_1));
read_data_2 <= reg_mem(conv_integer(read_reg_2));

mem_process: process(write_reg, write_data)
begin
		if (RegWrite = '1') then
			reg_mem(conv_integer(write_reg)) <= write_data;
		end if;
end process mem_process;

end behavioral;
