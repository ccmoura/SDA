library IEEE;
USE ieee.std_logic_1164.all;

ENTITY splitKey IS
port(
	bitArray: in std_logic_vector(0 to 55);
	out1, out2: out std_logic_vector(0 to 27)
);
end splitKey;
architecture comportamento of splitKey is  
begin
	out1 <= bitArray(0 to 27);
	out2 <= bitArray(28 to 55);
end comportamento;