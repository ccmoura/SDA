LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY fulladder is
PORT(
	A, B, Cin : in std_logic;
	Cout, S : out std_logic
);
END fulladder;
architecture comportamento of fulladder is
BEGIN
	S <= A xor B xor Cin;
	Cout <= ((A xor B) and Cin) or (B and A);
end comportamento;
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY fulladder4bits is
PORT (
	A, B : in std_logic_vector(0 to 3);
	Cin : in std_logic;
	Cout : out std_logic;
	S : out std_logic_vector(0 to 3)
);
END fulladder4bits;
architecture comportamento of fulladder4bits is 
signal fio : std_logic_vector(0 to 2);
component fulladder
PORT(
	A, B, Cin : in std_logic;
	Cout, S : out std_logic
);
end component;
BEGIN
	fa1: fulladder
		port map(A => A(0), B => B(0), Cin => Cin, Cout => fio(0), S => S(0));
	fa2: fulladder
		port map(A => A(1), B => B(1), Cin => fio(0), Cout => fio(1), S => S(1));
	fa3: fulladder
		port map(A => A(2), B => B(2), Cin => fio(1), Cout => fio(2), S => S(2));
	fa4: fulladder
		port map(A => A(3), B => B(3), Cin => fio(2), Cout => Cout, S => S(3));
END comportamento;
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY mux2pra14b is
PORT (
	sel : in bit;
	K, Q : in std_logic_vector(0 to 3);
	J : out std_logic_vector(0 to 3)
);
END mux2pra14b;
architecture comportamento of mux2pra14b is
BEGIN
	with sel select
		J <= K when '0',
			Q when others;
END comportamento;
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY mux2pra1 is
PORT (
	X, Y, sel : in std_logic;
	Z : out std_logic
);
END mux2pra1;
architecture comportamento of mux2pra1 is
BEGIN
	Z <= (X and not sel) or (Y and sel);
END comportamento;
--full adder, mux4pra1 e mux2pra1
--somador 32 bits v
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY CarrySelector is 
PORT (
	A : in std_logic_vector (0 to 31);
	B : in std_logic_vector (0 to 31);
	CinS : in std_logic;
	S : out std_logic_vector (0 to 31);
	CoutS : out std_logic
);
END CarrySelector;
architecture comportamento of CarrySelector is  
	signal TempC: std_logic_vector (0 to 21);
	signal TempS: std_logic_vector (0 to 55);
component fulladder4bits
PORT (
	A, B : in std_logic_vector(0 to 3);
	Cin : in std_logic;
	Cout : out std_logic;
	S : out std_logic_vector(0 to 3)
);
end component;
component mux2pra1
PORT(
	X, Y, sel : in std_logic;
	Z : out std_logic
);
end component;
component mux2pra14b
PORT(
	sel : in std_logic;
	K, Q : in std_logic_vector(0 to 3);
	J : out std_logic_vector(0 to 3)
);
end component;
BEGIN 
	s1: fulladder4bits
		port map(A => A(0 to 3), B => B(0 to 3), Cin => CinS, Cout => TempC(0), S => S(0 to 3));
	s2: fulladder4bits
		port map(A => A(4 to 7), B => B(4 to 7), Cin => '0', Cout => TempC(1), S => TempS(0 to 3));
	s3: fulladder4bits
		port map(A => A(4 to 7), B => B(4 to 7), Cin => '1', Cout => TempC(2), S => TempS(4 to 7));
	mux14b : mux2pra14b
		port map(K => TempS(0 to 3), Q => TempS(4 to 7), sel => TempC(0), J => S(4 to 7));
	mux1 : mux2pra1
		port map(X => TempC(1), Y => TempC(2), sel => TempC(0), Z => TempC(3));
	
	
	s4: fulladder4bits
		port map(A => A(8 to 11), B => B(8 to 11), Cin => '0', Cout => TempC(4), S => TempS(8 to 11));
	s5: fulladder4bits
		port map(A => A(8 to 11), B => B(8 to 11), Cin => '1', Cout => TempC(5), S => TempS(12 to 15));
	mux24b : mux2pra14b
		port map(K => TempS(8 to 11), Q => TempS(12 to 15), sel => TempC(3), J => S(8 to 11));
	mux2 : mux2pra1
		port map(X => TempC(4), Y => TempC(5), sel => TempC(3), Z => TempC(6));
		
	
	s6: fulladder4bits
		port map(A => A(12 to 15), B => B(12 to 15), Cin => '0', Cout => TempC(7), S => TempS(16 to 19));
	s7: fulladder4bits
		port map(A => A(12 to 15), B => B(12 to 15), Cin => '1', Cout => TempC(8), S => TempS(20 to 23));
	mux34b : mux2pra14b
		port map(K => TempS(16 to 19), Q => TempS(20 to 23), sel => TempC(6), J => S(12 to 15));
	mux3 : mux2pra1
		port map(X => TempC(7), Y => TempC(8), sel => TempC(6), Z => TempC(9));
		
		
	s8: fulladder4bits
		port map(A => A(16 to 19), B => B(16 to 19), Cin => '0', Cout => TempC(10), S => TempS(24 to 27));
	s9: fulladder4bits
		port map(A => A(16 to 19), B => B(16 to 19), Cin => '1', Cout => TempC(11), S => TempS(28 to 31));
	mux44b : mux2pra14b
		port map(K => TempS(24 to 27), Q => TempS(28 to 31), sel => TempC(9), J => S(16 to 19));
	mux4 : mux2pra1
		port map(X => TempC(10), Y => TempC(11), sel => TempC(9), Z => TempC(12));
		
		
	s10: fulladder4bits
		port map(A => A(20 to 23), B => B(20 to 23), Cin => '0', Cout => TempC(13), S => TempS(32 to 35));
	s11: fulladder4bits
		port map(A => A(20 to 23), B => B(20 to 23), Cin => '1', Cout => TempC(14), S => TempS(36 to 39));
	mux54b : mux2pra14b
		port map(K => TempS(32 to 35), Q => TempS(36 to 39), sel => TempC(12), J => S(20 to 23));
	mux5 : mux2pra1
		port map(X => TempC(13), Y => TempC(14), sel => TempC(12), Z => TempC(15));
		
	
	s12: fulladder4bits
		port map(A => A(24 to 27), B => B(24 to 27), Cin => '0', Cout => TempC(16), S => TempS(40 to 43));
	s13: fulladder4bits
		port map(A => A(24 to 27), B => B(24 to 27), Cin => '1', Cout => TempC(17), S => TempS(44 to 47));
	mux64b : mux2pra14b
		port map(K => TempS(40 to 43), Q => TempS(44 to 47), sel => TempC(15), J => S(24 to 27));
	mux6 : mux2pra1
		port map(X => TempC(16), Y => TempC(17), sel => TempC(15), Z => TempC(18));
		
	s14: fulladder4bits
		port map(A => A(28 to 31), B => B(28 to 31), Cin => '0', Cout => TempC(19), S => TempS(48 to 51));
	s15: fulladder4bits
		port map(A => A(28 to 31), B => B(28 to 31), Cin => '1', Cout => TempC(20), S => TempS(52 to 55));
	mux74b : mux2pra14b
		port map(K => TempS(48 to 51), Q => TempS(52 to 55), sel => TempC(18), J => S(28 to 31));
	mux7 : mux2pra1
		port map(X => TempC(19), Y => TempC(20), sel => TempC(18), Z => TempC(21));
end comportamento;