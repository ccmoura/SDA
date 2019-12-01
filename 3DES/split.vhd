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
	out1(0) <= bitArray(57);
	out1(1) <= bitArray(49);
	out1(2) <= bitArray(41);
	out1(3) <= bitArray(33);
	out1(4) <= bitArray(25);
	out1(5) <= bitArray(17);
	out1(6) <= bitArray(9);
	out1(7) <= bitArray(1);
	out1(8) <= bitArray(59);
	out1(9) <= bitArray(51);
	out1(10) <= bitArray(43);
	out1(11) <= bitArray(35);
	out1(12) <= bitArray(27);
	out1(13) <= bitArray(19);
	out1(14) <= bitArray(11);
	out1(15) <= bitArray(3);
	out1(16) <= bitArray(61);
	out1(17) <= bitArray(53);
	out1(18) <= bitArray(45);
	out1(19) <= bitArray(37);
	out1(20) <= bitArray(29);
	out1(21) <= bitArray(21);
	out1(22) <= bitArray(13);
	out1(23) <= bitArray(5);
	out1(24) <= bitArray(63);
	out1(25) <= bitArray(55);
	out1(26) <= bitArray(47);
	out1(27) <= bitArray(39);
	out1(28) <= bitArray(31);
	out1(29) <= bitArray(23);
	out1(30) <= bitArray(15);
	out1(31) <= bitArray(7);
	
	out2(0) <= bitArray(56);
	out2(1) <= bitArray(48);
	out2(2) <= bitArray(40);
	out2(3) <= bitArray(32);
	out2(4) <= bitArray(24);
	out2(5) <= bitArray(16);
	out2(6) <= bitArray(8);
	out2(7) <= bitArray(0);
	out2(8) <= bitArray(58);
	out2(9) <= bitArray(50);
	out2(10) <= bitArray(42);
	out2(11) <= bitArray(34);
	out2(12) <= bitArray(26);
	out2(13) <= bitArray(18);
	out2(14) <= bitArray(10);
	out2(15) <= bitArray(2);
	out2(16) <= bitArray(60);
	out2(17) <= bitArray(52);
	out2(18) <= bitArray(44);
	out2(19) <= bitArray(36);
	out2(20) <= bitArray(28);
	out2(21) <= bitArray(20);
	out2(22) <= bitArray(12);
	out2(23) <= bitArray(4);
	out2(24) <= bitArray(62);
	out2(25) <= bitArray(54);
	out2(26) <= bitArray(46);
	out2(27) <= bitArray(38);
	out2(28) <= bitArray(30);
	out2(29) <= bitArray(22);
	out2(30) <= bitArray(14);
	out2(31) <= bitArray(6);
end comportamento;