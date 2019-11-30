library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY KeyModule IS
PORT(
	kIn: in unsigned(0 to 55);
	kOut1, kOut2, kOut3, kOut4,
	kOut5, kOut6, kOut7, kOut8, 
	kOut9, kOut10, kOut11, kOut12, 
	kOut13, kOut14, kOut15, kOut16: out unsigned(0 to 47)
);
END KeyModule;

architecture comportamento of KeyModule is  
signal s1, s2, s3, s4,
 s5, s6, s7, s8, s9, s10,
 s11, s12, s13, s14, s15, 
 s16, s17, s18, s19, s20, 
 s21, s22, s23, s24, s25, 
 s26, s27, s28, s29, s30, s31, s32 : unsigned(0 to 27);
signal kp2split : unsigned(0 to 55);
signal split2kg : unsigned(0 to 55);
component KeyPermutation
PORT(
	bitArray: in unsigned(0 to 55);
	outArray: out unsigned(0 to 55)
);
end component;
component splitKey
port(
	keyArray: in unsigned(0 to 55);
	out1, out2: out unsigned(0 to 27)
);
end component;
component KeyGenerator
PORT(
	key1, key2: in unsigned(0 to 27);
	keyGenerated: out unsigned(0 to 47);
	outRotation1, outRotation2 : out unsigned(0 to 27)
);
end component;

begin
	kp: KeyPermutation
		port map(bitArray => kIn, outArray => kp2split);
	s: splitKey
		port map(keyArray => kp2split, out1 => split2kg(0 to 27), out2 => split2kg(28 to 55));
	kg1: KeyGenerator
		port map(key1 => split2kg(0 to 27), key2 => split2kg(28 to 55), keyGenerated => kOut1, outRotation1 => s1, outRotation2 => s2);
	kg2: KeyGenerator
		port map(key1 => s1, key2 => s2, keyGenerated => kOut2, outRotation1 => s3, outRotation2 => s4);
	kg3: KeyGenerator
		port map(key1 => s3, key2 => s4, keyGenerated => kOut3, outRotation1 => s5, outRotation2 => s6);
	kg4: KeyGenerator
		port map(key1 => s5, key2 => s6, keyGenerated => kOut4, outRotation1 => s7, outRotation2 => s8);
	kg5: KeyGenerator
		port map(key1 => s7, key2 => s8, keyGenerated => kOut5, outRotation1 => s9, outRotation2 => s10);
	kg6: KeyGenerator
		port map(key1 => s9, key2 => s10, keyGenerated => kOut6, outRotation1 => s11, outRotation2 => s12);
	kg7: KeyGenerator
		port map(key1 => s11, key2 => s12, keyGenerated => kOut7, outRotation1 => s13, outRotation2 => s14);
	kg8: KeyGenerator
		port map(key1 => s13, key2 => s14, keyGenerated => kOut8, outRotation1 => s15, outRotation2 => s16);
	kg9: KeyGenerator
		port map(key1 => s15, key2 => s16, keyGenerated => kOut9, outRotation1 => s17, outRotation2 => s18);
	kg10: KeyGenerator
		port map(key1 => s17, key2 => s18, keyGenerated => kOut10, outRotation1 => s19, outRotation2 => s20);
	kg11: KeyGenerator
		port map(key1 => s19, key2 => s20, keyGenerated => kOut11, outRotation1 => s21, outRotation2 => s22);
	kg12: KeyGenerator
		port map(key1 => s21, key2 => s22, keyGenerated => kOut12, outRotation1 => s23, outRotation2 => s24);
	kg13: KeyGenerator
		port map(key1 => s23, key2 => s24, keyGenerated => kOut13, outRotation1 => s25, outRotation2 => s26);
	kg14: KeyGenerator
		port map(key1 => s25, key2 => s26, keyGenerated => kOut14, outRotation1 => s27, outRotation2 => s28);
	kg15: KeyGenerator
		port map(key1 => s27, key2 => s28, keyGenerated => kOut15, outRotation1 => s29, outRotation2 => s30);
	kg16: KeyGenerator
		port map(key1 => s29, key2 => s30, keyGenerated => kOut16, outRotation1 => s31, outRotation2 => s32);
end comportamento;