library IEEE;
USE ieee.std_logic_1164.all;

ENTITY permutation IS
port(
	bitArray: in std_logic_vector(0 to 55);
	outArray: out std_logic_vector(0 to 47)
);
end permutation;
architecture comportamento of permutation is  
signal b : std_logic;
begin
	outArray(0) <= bitArray(13);
	outArray(1) <= bitArray(16);
	outArray(2) <= bitArray(10);
	outArray(3) <= bitArray(23);
	outArray(4) <= bitArray(0);
	outArray(5) <= bitArray(4);
	outArray(6) <= bitArray(2);
	outArray(7) <= bitArray(27);
	outArray(8) <= bitArray(14);
	outArray(9) <= bitArray(5);
	outArray(10) <= bitArray(20);
	outArray(11) <= bitArray(9);
	outArray(12) <= bitArray(22);
	outArray(13) <= bitArray(18);
	outArray(14) <= bitArray(11);
	outArray(15) <= bitArray(3);
	outArray(16) <= bitArray(25);
	outArray(17) <= bitArray(7);
	outArray(18) <= bitArray(15);
	outArray(19) <= bitArray(6);
	outArray(20) <= bitArray(26);
	outArray(21) <= bitArray(19);
	outArray(22) <= bitArray(12);
	outArray(23) <= bitArray(1);
	outArray(24) <= bitArray(40);
	outArray(25) <= bitArray(51);
	outArray(26) <= bitArray(30);
	outArray(27) <= bitArray(36);
	outArray(28) <= bitArray(46);
	outArray(29) <= bitArray(54);
	outArray(30) <= bitArray(29);
	outArray(31) <= bitArray(39);
	outArray(32) <= bitArray(50);
	outArray(33) <= bitArray(44);
	outArray(34) <= bitArray(32);
	outArray(35) <= bitArray(47);
	outArray(36) <= bitArray(43);
	outArray(37) <= bitArray(48);
	outArray(38) <= bitArray(38);
	outArray(39) <= bitArray(55);
	outArray(40) <= bitArray(33);
	outArray(41) <= bitArray(52);
	outArray(42) <= bitArray(45);
	outArray(43) <= bitArray(41);
	outArray(44) <= bitArray(49);
	outArray(45) <= bitArray(35);
	outArray(46) <= bitArray(28);
	outArray(47) <= bitArray(31);
end comportamento;