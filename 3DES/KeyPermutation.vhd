library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY KeyPermutation IS
PORT(
	bitArray: in unsigned(0 to 55);
	outArray: out unsigned(0 to 55)
);
END KeyPermutation;

architecture comportamento of KeyPermutation is  
begin
	outArray(0) <= bitArray(56);
	outArray(1) <= bitArray(48);
	outArray(2) <= bitArray(40);
	outArray(3) <= bitArray(32);
	outArray(4) <= bitArray(24);
	outArray(5) <= bitArray(16);
	outArray(6) <= bitArray(8);
	outArray(7) <= bitArray(0);
	outArray(8) <= bitArray(57);
	outArray(9) <= bitArray(49);
	outArray(10) <= bitArray(41);
	outArray(11) <= bitArray(33);
	outArray(12) <= bitArray(25);
	outArray(13) <= bitArray(17);
	outArray(14) <= bitArray(9);
	outArray(15) <= bitArray(1);
	outArray(16) <= bitArray(58);
	outArray(17) <= bitArray(50);
	outArray(18) <= bitArray(42);
	outArray(19) <= bitArray(34);
	outArray(20) <= bitArray(26);
	outArray(21) <= bitArray(18);
	outArray(22) <= bitArray(10);
	outArray(23) <= bitArray(2);
	outArray(24) <= bitArray(59);
	outArray(25) <= bitArray(51);
	outArray(26) <= bitArray(43);
	outArray(27) <= bitArray(35);
	outArray(28) <= bitArray(62);
	outArray(29) <= bitArray(54);
	outArray(30) <= bitArray(46);
	outArray(31) <= bitArray(38);
	outArray(32) <= bitArray(30);
	outArray(33) <= bitArray(22);
	outArray(34) <= bitArray(14);
	outArray(35) <= bitArray(6);
	outArray(36) <= bitArray(61);
	outArray(37) <= bitArray(53);
	outArray(38) <= bitArray(45);
	outArray(39) <= bitArray(37);
	outArray(40) <= bitArray(29);
	outArray(41) <= bitArray(21);
	outArray(42) <= bitArray(13);
	outArray(43) <= bitArray(5);
	outArray(44) <= bitArray(60);
	outArray(45) <= bitArray(52);
	outArray(46) <= bitArray(44);
	outArray(47) <= bitArray(36);
	outArray(48) <= bitArray(28);
	outArray(49) <= bitArray(20);
	outArray(50) <= bitArray(12);
	outArray(51) <= bitArray(4);
	outArray(52) <= bitArray(27);
	outArray(53) <= bitArray(19);
	outArray(54) <= bitArray(11);
	outArray(55) <= bitArray(3);
	
end comportamento;