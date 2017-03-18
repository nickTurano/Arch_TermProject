library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Inst_Mem is
  component Inst_Mem is
    port (
      address: in STD_LOGIC_VECTOR (31 downto 0);
      read_data: out STD_LOGIC_VECTOR (31 downto 0)
      );
  end Inst_Mem;


architecture behavioral of memory is

type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

signal inst_mem: mem_array := (
    X"00000000", -- initialize data memory
    X"00000000", -- mem 1
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", -
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
  process(address) begin
    read_data <= inst_mem(conv_integer(address(6 downto 2)));
  end process;
end behavioral;
