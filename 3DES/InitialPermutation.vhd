library IEEE;
USE ieee.std_logic_1164.all;

ENTITY InitialPermutation IS
PORT(
	bitArray: in std_logic_vector(0 to 63);
	outArray: out std_logic_vector(0 to 63)
);
END InitialPermutation;

architecture comportamento of InitialPermutation is  
begin
	outArray(0) <= bitArray(57);
	outArray(1) <= bitArray(49);
	outArray(2) <= bitArray(41);
	outArray(3) <= bitArray(33);
	outArray(4) <= bitArray(25);
	outArray(5) <= bitArray(17);
	outArray(6) <= bitArray(9);
	outArray(7) <= bitArray(1);
	outArray(8) <= bitArray(59);
	outArray(9) <= bitArray(51);
	outArray(10) <= bitArray(43);
	outArray(11) <= bitArray(35);
	outArray(12) <= bitArray(27);
	outArray(13) <= bitArray(19);
	outArray(14) <= bitArray(11);
	outArray(15) <= bitArray(3);
	outArray(16) <= bitArray(61);
	outArray(17) <= bitArray(53);
	outArray(18) <= bitArray(45);
	outArray(19) <= bitArray(37);
	outArray(20) <= bitArray(29);
	outArray(21) <= bitArray(21);
	outArray(22) <= bitArray(13);
	outArray(23) <= bitArray(5);
	outArray(24) <= bitArray(63);
	outArray(25) <= bitArray(55);
	outArray(26) <= bitArray(47);
	outArray(27) <= bitArray(39);
	outArray(28) <= bitArray(31);
	outArray(29) <= bitArray(23);
	outArray(30) <= bitArray(15);
	outArray(31) <= bitArray(7);
	outArray(32) <= bitArray(56);
	outArray(33) <= bitArray(48);
	outArray(34) <= bitArray(40);
	outArray(35) <= bitArray(32);
	outArray(36) <= bitArray(24);
	outArray(37) <= bitArray(16);
	outArray(38) <= bitArray(8);
	outArray(39) <= bitArray(0);
	outArray(40) <= bitArray(58);
	outArray(41) <= bitArray(50);
	outArray(42) <= bitArray(42);
	outArray(43) <= bitArray(34);
	outArray(44) <= bitArray(26);
	outArray(45) <= bitArray(18);
	outArray(46) <= bitArray(10);
	outArray(47) <= bitArray(2);
	outArray(48) <= bitArray(60);
	outArray(49) <= bitArray(52);
	outArray(50) <= bitArray(44);
	outArray(51) <= bitArray(36);
	outArray(52) <= bitArray(28);
	outArray(53) <= bitArray(20);
	outArray(54) <= bitArray(12);
	outArray(55) <= bitArray(4);
	outArray(56) <= bitArray(62);
	outArray(57) <= bitArray(54);
	outArray(58) <= bitArray(46);
	outArray(59) <= bitArray(38);
	outArray(60) <= bitArray(30);
	outArray(61) <= bitArray(22);
	outArray(62) <= bitArray(14);
	outArray(63) <= bitArray(6);
	
end comportamento;