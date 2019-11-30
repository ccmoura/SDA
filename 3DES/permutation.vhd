library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY permutation IS
port(
	k: in unsigned(0 to 55);
	o: out unsigned(0 to 47)
);
end permutation;
architecture comportamento of permutation is  
signal b : unsigned;
begin
	o(0) <= k(13);
	o(1) <= k(16);
	o(2) <= k(10);
	o(3) <= k(23);
	o(4) <= k(0);
	o(5) <= k(4);
	o(6) <= k(2);
	o(7) <= k(27);
	o(8) <= k(14);
	o(9) <= k(5);
	o(10) <= k(20);
	o(11) <= k(9);
	o(12) <= k(22);
	o(13) <= k(18);
	o(14) <= k(11);
	o(15) <= k(3);
	o(16) <= k(25);
	o(17) <= k(7);
	o(18) <= k(15);
	o(19) <= k(6);
	o(20) <= k(26);
	o(21) <= k(19);
	o(22) <= k(12);
	o(23) <= k(1);
	o(24) <= k(40);
	o(25) <= k(51);
	o(26) <= k(30);
	o(27) <= k(36);
	o(28) <= k(46);
	o(29) <= k(54);
	o(30) <= k(29);
	o(31) <= k(39);
	o(32) <= k(50);
	o(33) <= k(44);
	o(34) <= k(32);
	o(35) <= k(47);
	o(36) <= k(43);
	o(37) <= k(48);
	o(38) <= k(38);
	o(39) <= k(55);
	o(40) <= k(33);
	o(41) <= k(52);
	o(42) <= k(45);
	o(43) <= k(41);
	o(44) <= k(49);
	o(45) <= k(35);
	o(46) <= k(28);
	o(47) <= k(31);
end comportamento;