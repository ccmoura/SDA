library IEEE; 
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY manchester is
PORT (
	A, B : in std_logic_vector(0 to 31);
	S : out std_logic_vector(0 to 31)
);
END manchester 

architecture comportamento of manchester is 
BEGIN 
	S <= A + B;
END comportamento;