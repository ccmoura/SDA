library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY splitKey IS
port(
	keyArray: in unsigned(0 to 55);
	out1, out2: out unsigned(0 to 27)
);
end splitKey;
architecture comportamento of splitKey is  
begin
	out1 <= keyArray(0 to 27);
	out2 <= keyArray(28 to 55);
end comportamento;