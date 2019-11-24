library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY BinaryRotation IS
port(
	bitArray: in unsigned(0 to 27);
	outArray: out unsigned(0 to 27)
);
end BinaryRotation;
architecture comportamento of BinaryRotation is  
signal b : std_logic;
begin
	b <= bitArray(0);
	outArray <= shift_left(unsigned(bitArray), 1);
	outArray(27) <= b;
end comportamento;