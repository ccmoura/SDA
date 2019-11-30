library IEEE;
use ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

ENTITY split IS
port(
	bitArray: in unsigned(0 to 63);
	out1, out2: out unsigned(0 to 31)
);
end split;
architecture comportamento of split is  
begin
	out1 <= bitArray(0 to 31);
	out2 <= bitArray(32 to 63);
end comportamento;