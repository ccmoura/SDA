--generate a key

library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY KeyGenerator IS
PORT(
	key1, key2: in unsigned(0 to 27);
	keyGenerated: out unsigned(0 to 47);
	outRotation1, outRotation2 : out unsigned(0 to 27)
);
END KeyGenerator;

architecture comportamento of KeyGenerator is  
--signals
signal binaryrotation2permutation0 : unsigned(0 to 27);
signal binaryrotation2permutation1 : unsigned(0 to 27);
--components
component BinaryRotation
port(
	x: in unsigned(0 to 27);
	y, z: out unsigned(0 to 27)
);
end component;
component permutation
port(
	k: in unsigned(0 to 55);
	o: out unsigned(0 to 47)
);
end component;

begin
	br0: binaryRotation
		port map(x => key1, y => binaryrotation2permutation0, z => outRotation1);
	br1: binaryRotation
		port map(x => key2, y => binaryrotation2permutation1, z => outRotation2);
	p: permutation
		port map(k(0 to 27) => binaryrotation2permutation0, k(28 to 55) => binaryrotation2permutation1, o => keyGenerated);
end comportamento;