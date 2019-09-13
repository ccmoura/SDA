ENTITY somador is
PORT (
	A, B, Cin : in bit;
	p, g, S : out bit
);
END somador;
architecture comportamento of somador is 
BEGIN 
	S <= A xor B xor Cin;
	p <= A or B;
	g <= A and B;
END comportamento;
ENTITY CLG4bits is
PORT (
	gVector, pVector : in bit_vector(0 to 3);
	cin : in bit;
	carryVector : out bit_vector(0 to 3)
);
END CLG4bits;
architecture comportamento of CLG4bits is 
BEGIN 
	carryVector(0) <= (pVector(0) and cin) or gVector(0);
	carryVector(1) <= (pVector(1) and gVector(0)) or (cin and pVector(1) and pVector(0)) or gVector(1);
	carryVector(2) <= (pVector(2) and gVector(1)) or (pVector(2) and pVector(1) and gVector(0)) or (pVector(2) and pVector(1) and pVector(0) and cin) or gVector(2);
	carryVector(3) <= (pVector(3) and gVector(2)) or (pVector(3) and pVector(2) and gVector(1)) or (pVector(3) and pVector(2) and pVector(1) and gVector(0)) or (pVector(3) and pVector(2) and pVector(1) and pVector(0) and cin) or gVector(3);
END comportamento;
--somador e carry lookahead ^
--somador 32 bits v
ENTITY Somador32Bits is 
PORT (
	A : in bit_vector (0 to 31);
	B : in bit_vector (0 to 31);
	CinS : in bit;
	S : out bit_vector (0 to 31);
	CoutS : out bit
);
END Somador32Bits;
architecture comportamento of Somador32Bits is  
	signal TempC: bit_vector (0 to 30);
	signal TempP: bit_vector (0 to 31);
	signal TempG: bit_vector (0 to 31);
component CLG4bits
PORT (
	gVector, pVector : in bit_vector(0 to 3);
	cin : in bit;
	carryVector : out bit_vector(0 to 3)
);
end component;
component somador
PORT (
	A, B, Cin: in bit;
	p, g, S : out bit
);
end component;
BEGIN 
	s1: somador
		port map(A => A(0), B => B(0), S => S(0), Cin => CinS, p => TempP(0), g => TempG(0));
	s2: somador
		port map(A => A(1), B => B(1), S => S(1), Cin => TempC(0), p => TempP(1), g => TempG(1));
	s3: somador
		port map(A => A(2), B => B(2), S => S(2), Cin => TempC(1), p => TempP(2), g => TempG(2));
	s4: somador
		port map(A => A(3), B => B(3), S => S(3), Cin => TempC(2), p => TempP(3), g => TempG(3));
	CLG1: CLG4bits
		port map(cin => CinS, gVector => TempG(0 to 3), pVector => TempP(0 to 3), carryVector => TempC(0 to 3));
		
	s5: somador
		port map(A => A(4), B => B(4), S => S(4), Cin => TempC(3), p => TempP(4), g => TempG(4));
	s6: somador
		port map(A => A(5), B => B(5), S => S(5), Cin => TempC(4), p => TempP(5), g => TempG(5));
	s7: somador
		port map(A => A(6), B => B(6), S => S(6), Cin => TempC(5), p => TempP(6), g => TempG(6));
	s8: somador
		port map(A => A(7), B => B(7), S => S(7), Cin => TempC(6), p => TempP(7), g => TempG(7));
	CLG2: CLG4bits
		port map(cin => TempC(3), gVector => TempG(4 to 7), pVector => TempP(4 to 7), carryVector => TempC(4 to 7));
	
	s9: somador
		port map(A => A(8), B => B(8), S => S(8), Cin => TempC(7), p => TempP(8), g => TempG(8));
	s10: somador
		port map(A => A(9), B => B(9), S => S(9), Cin => TempC(8), p => TempP(9), g => TempG(9));
	s11: somador
		port map(A => A(10), B => B(10), S => S(10), Cin => TempC(9), p => TempP(10), g => TempG(10));
	s12: somador
		port map(A => A(11), B => B(11), S => S(11), Cin => TempC(10), p => TempP(11), g => TempG(11));
	CLG3: CLG4bits
		port map(cin => TempC(7), gVector => TempG(8 to 11), pVector => TempP(8 to 11), carryVector => TempC(8 to 11));
		
	s13: somador
		port map(A => A(12), B => B(12), S => S(12), Cin => TempC(11), p => TempP(12), g => TempG(12));
	s14: somador
		port map(A => A(13), B => B(13), S => S(13), Cin => TempC(12), p => TempP(13), g => TempG(13));
	s15: somador
		port map(A => A(14), B => B(14), S => S(14), Cin => TempC(13), p => TempP(14), g => TempG(14));
	s16: somador
		port map(A => A(15), B => B(15), S => S(15), Cin => TempC(14), p => TempP(15), g => TempG(15));
	CLG4: CLG4bits
		port map(cin => TempC(11), gVector => TempG(12 to 15), pVector => TempP(12 to 15), carryVector => TempC(12 to 15));
		
	s17: somador
		port map(A => A(16), B => B(16), S => S(16), Cin => TempC(15), p => TempP(16), g => TempG(16));
	s18: somador
		port map(A => A(17), B => B(17), S => S(17), Cin => TempC(16), p => TempP(17), g => TempG(17));
	s19: somador
		port map(A => A(18), B => B(18), S => S(18), Cin => TempC(17), p => TempP(18), g => TempG(18));
	s20: somador
		port map(A => A(19), B => B(19), S => S(19), Cin => TempC(18), p => TempP(19), g => TempG(19));
	CLG5: CLG4bits
		port map(cin => TempC(12), gVector => TempG(16 to 19), pVector => TempP(16 to 19), carryVector => TempC(16 to 19));
		
	s21: somador
		port map(A => A(20), B => B(20), S => S(20), Cin => TempC(19), p => TempP(20), g => TempG(20));
	s22: somador
		port map(A => A(21), B => B(21), S => S(21), Cin => TempC(20), p => TempP(21), g => TempG(21));
	s23: somador
		port map(A => A(22), B => B(22), S => S(22), Cin => TempC(21), p => TempP(22), g => TempG(22));
	s24: somador
		port map(A => A(23), B => B(23), S => S(23), Cin => TempC(22), p => TempP(23), g => TempG(23));
	CLG6: CLG4bits
		port map(cin => TempC(19), gVector => TempG(20 to 23), pVector => TempP(20 to 23), carryVector => TempC(20 to 23));	
	
	s25: somador
		port map(A => A(24), B => B(24), S => S(24), Cin => TempC(23), p => TempP(24), g => TempG(24));
	s26: somador
		port map(A => A(25), B => B(25), S => S(25), Cin => TempC(24), p => TempP(25), g => TempG(25));
	s27: somador
		port map(A => A(26), B => B(26), S => S(26), Cin => TempC(25), p => TempP(26), g => TempG(26));
	s28: somador
		port map(A => A(27), B => B(27), S => S(27), Cin => TempC(26), p => TempP(27), g => TempG(27));
	CLG7: CLG4bits
		port map(cin => TempC(23), gVector => TempG(24 to 27), pVector => TempP(24 to 27), carryVector => TempC(24 to 27));
		
	s29: somador
		port map(A => A(28), B => B(28), S => S(28), Cin => TempC(27), p => TempP(28), g => TempG(28));
	s30: somador
		port map(A => A(29), B => B(29), S => S(29), Cin => TempC(28), p => TempP(29), g => TempG(29));
	s31: somador
		port map(A => A(30), B => B(30), S => S(30), Cin => TempC(29), p => TempP(30), g => TempG(30));
	s32: somador
		port map(A => A(31), B => B(31), S => S(31), Cin => TempC(30), p => TempP(31), g => TempG(31));
	CLG8: CLG4bits
		port map(cin => TempC(27), gVector => TempG(28 to 31), pVector => TempP(28 to 31), carryVector(0 to 2) => TempC(28 to 30), carryVector(3) => CoutS);
		
end comportamento;