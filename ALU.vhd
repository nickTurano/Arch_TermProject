library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity ALU is
  port(
    src1, src2: in STD_LOGIC_VECTOR(31 down to 0);
    result: out STD_LOGIC_VECTOR(31 down to 0);
    zero: out bit;
  );
  
