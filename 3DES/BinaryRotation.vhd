library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY BinaryRotation IS
port(
	x: in unsigned(0 to 27);
	y, z: out unsigned(0 to 27)
);
end BinaryRotation;
architecture comportamento of BinaryRotation is  
begin
	y(0) <= x(1);
	y(1) <= x(2);
	y(2) <= x(3);
	y(3) <= x(4);
	y(4) <= x(5);
	y(5) <= x(6);
	y(6) <= x(7);
	y(7) <= x(8);
	y(8) <= x(9);
	y(9) <= x(10);
	y(10) <= x(11);
	y(11) <= x(12);
	y(12) <= x(13);
	y(13) <= x(14);
	y(14) <= x(15);
	y(15) <= x(16);
	y(16) <= x(17);
	y(17) <= x(18);
	y(18) <= x(19);
	y(19) <= x(20);
	y(20) <= x(21);
	y(21) <= x(22);
	y(22) <= x(23);
	y(23) <= x(24);
	y(24) <= x(25);
	y(25) <= x(26);
	y(26) <= x(27);
	y(27) <= x(0);
	
	z(0) <= x(1);
	z(1) <= x(2);
	z(2) <= x(3);
	z(3) <= x(4);
	z(4) <= x(5);
	z(5) <= x(6);
	z(6) <= x(7);
	z(7) <= x(8);
	z(8) <= x(9);
	z(9) <= x(10);
	z(10) <= x(11);
	z(11) <= x(12);
	z(12) <= x(13);
	z(13) <= x(14);
	z(14) <= x(15);
	z(15) <= x(16);
	z(16) <= x(17);
	z(17) <= x(18);
	z(18) <= x(19);
	z(19) <= x(20);
	z(20) <= x(21);
	z(21) <= x(22);
	z(22) <= x(23);
	z(23) <= x(24);
	z(24) <= x(25);
	z(25) <= x(26);
	z(26) <= x(27);
	z(27) <= x(0);
end comportamento;