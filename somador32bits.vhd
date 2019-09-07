ENTITY MeioSomador is
PORT (
	A, B : in bit;
	S, C : out bit
);
END MeioSomador;
architecture comportamento of MeioSomador is 
BEGIN 
	S <= A xor B;
	C <= A and B;
END comportamento;
ENTITY SomadorCompleto is
PORT (
	X, Y, Cin : in bit;
	Z, Cout : out bit
);
END SomadorCompleto;
architecture comportamento of SomadorCompleto is 
BEGIN 
	Z <=(X xor Y) xor Cin;
	Cout <= (X and Y) or (Y and Cin) or (X and Cin);
END comportamento;

--somadores completo e meio ^
--somador 32 bits v
ENTITY Somador32Bits is 
PORT (
	A : in bit_vector (0 to 31);
	B : in bit_vector (0 to 31);
	S : out bit_vector (0 to 31);
	C : out bit
);
END Somador32Bits;
architecture comportamento of Somador32Bits is  
	signal TempC: bit_vector (0 to 30);
component MeioSomador 
PORT (
	A, B : in bit;
	S, C : out bit
);
end component;
component SomadorCompleto
PORT (
	X, Y, Cin: in bit;
	Z, Cout : out bit
);
end component;
BEGIN 
	Half: MeioSomador
		port map(A => A(0), B => B(0), S => S(0), C => TempC(0));
	full1: SomadorCompleto
		port map(X => A(1), Y => B(1), Z => S(1), Cin => TempC(0), Cout => TempC(1));
	ful12: SomadorCompleto
		port map(X => A(2), Y => B(2), Z => S(2), Cin => TempC(1), Cout => TempC(2));
	ful13: SomadorCompleto
		port map(X => A(3), Y => B(3), Z => S(3), Cin => TempC(2), Cout => TempC(3));
	ful14: SomadorCompleto
		port map(X => A(4), Y => B(4), Z => S(4), Cin => TempC(3), Cout => TempC(4));
	ful15: SomadorCompleto
		port map(X => A(5), Y => B(5), Z => S(5), Cin => TempC(4), Cout => TempC(5));
	ful16: SomadorCompleto
		port map(X => A(6), Y => B(6), Z => S(6), Cin => TempC(5), Cout => TempC(6));
	ful17: SomadorCompleto
		port map(X => A(7), Y => B(7), Z => S(7), Cin => TempC(6), Cout => TempC(7));
	ful18: SomadorCompleto
		port map(X => A(8), Y => B(8), Z => S(8), Cin => TempC(7), Cout => TempC(8));
	ful19: SomadorCompleto
		port map(X => A(9), Y => B(9), Z => S(9), Cin => TempC(8), Cout => TempC(9));
	ful110: SomadorCompleto
		port map(X => A(10), Y => B(10), Z => S(10), Cin => TempC(9), Cout => TempC(10));
	ful111: SomadorCompleto
		port map(X => A(11), Y => B(11), Z => S(11), Cin => TempC(10), Cout => TempC(11));
	ful112: SomadorCompleto
		port map(X => A(12), Y => B(12), Z => S(12), Cin => TempC(11), Cout => TempC(12));
	ful113: SomadorCompleto
		port map(X => A(13), Y => B(13), Z => S(13), Cin => TempC(12), Cout => TempC(13));
	ful114: SomadorCompleto
		port map(X => A(14), Y => B(14), Z => S(14), Cin => TempC(13), Cout => TempC(14));
	ful115: SomadorCompleto
		port map(X => A(15), Y => B(15), Z => S(15), Cin => TempC(14), Cout => TempC(15));
	ful116: SomadorCompleto
		port map(X => A(16), Y => B(16), Z => S(16), Cin => TempC(15), Cout => TempC(16));
	ful117: SomadorCompleto
		port map(X => A(17), Y => B(17), Z => S(17), Cin => TempC(16), Cout => TempC(17));
	ful118: SomadorCompleto
		port map(X => A(18), Y => B(18), Z => S(18), Cin => TempC(17), Cout => TempC(18));
	ful119: SomadorCompleto
		port map(X => A(19), Y => B(19), Z => S(19), Cin => TempC(18), Cout => TempC(19));
	ful120: SomadorCompleto
		port map(X => A(20), Y => B(20), Z => S(20), Cin => TempC(19), Cout => TempC(20));
	ful121: SomadorCompleto
		port map(X => A(21), Y => B(21), Z => S(21), Cin => TempC(20), Cout => TempC(21));
	ful122: SomadorCompleto
		port map(X => A(22), Y => B(22), Z => S(22), Cin => TempC(21), Cout => TempC(22));
	ful123: SomadorCompleto
		port map(X => A(23), Y => B(23), Z => S(23), Cin => TempC(22), Cout => TempC(23));
	ful124: SomadorCompleto
		port map(X => A(24), Y => B(24), Z => S(24), Cin => TempC(23), Cout => TempC(24));
	ful125: SomadorCompleto
		port map(X => A(25), Y => B(25), Z => S(25), Cin => TempC(24), Cout => TempC(25));
	ful126: SomadorCompleto
		port map(X => A(26), Y => B(26), Z => S(26), Cin => TempC(25), Cout => TempC(26));
	ful127: SomadorCompleto
		port map(X => A(27), Y => B(27), Z => S(27), Cin => TempC(26), Cout => TempC(27));
	ful128: SomadorCompleto
		port map(X => A(28), Y => B(28), Z => S(28), Cin => TempC(27), Cout => TempC(28));
	ful129: SomadorCompleto
		port map(X => A(29), Y => B(29), Z => S(29), Cin => TempC(28), Cout => TempC(29));
	ful130: SomadorCompleto
		port map(X => A(30), Y => B(30), Z => S(30), Cin => TempC(29), Cout => TempC(30));
	full31: SomadorCompleto
		port map(X => A(31), Y => B(31), Z => S(31), Cin => TempC(30), Cout => C);
		
end comportamento;