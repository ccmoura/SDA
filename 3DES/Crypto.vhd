library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY Crypto IS
PORT(
	message: in unsigned(0 to 63);
	key: in unsigned(0 to 167);
	r: out std_logic
);
END Crypto;

architecture comportamento of Crypto is  
signal outIp1, outIp2, outIp3 : unsigned(0 to 63);
signal split1Out1, split1Out2, split2Out1, split2Out2, split3Out1, split3Out2 : unsigned(0 to 31);
signal splitkey1Out1, splitkey1Out2, splitkey2Out1, splitkey2Out2, splitkey3Out1, splitkey3Out2 : unsigned(0 to 31);
signal keypermutation1out : unsigned(0 to 55);
signal keygenerator1Out, keygenerator2Out, keygenerator3Out, keygenerator4Out, keygenerator5Out, keygenerator6Out, keygenerator7Out, keygenerator8Out, keygenerator9Out, keygenerator10Out, keygenerator11Out, keygenerator12Out, keygenerator13Out, keygenerator14Out, keygenerator15Out, keygenerator16Out : unsigned(0 to 47);
signal br1kg1, br2kg1, br1kg2, br2kg2, br1kg3, br2kg3, br1kg4, br2kg4, br1kg5, br2kg5, br1kg6, br2kg6, br1kg7, br2kg7, br1kg8, br2kg8, br1kg9, br2kg9, br1kg10, br2kg10, br1kg11, br2kg11, br1kg12, br2kg12, br1kg13, br2kg13, br1kg14, br2kg14, br1kg15, br2kg15, br1kg16, br2kg16 : unsigned(0 to 27);
signal outfp1, outfp2, outfp3 : unsigned(0 to 64);
signal box1out1, box1out2, box2out1, box2out2, box3out1, box3out2, box4out1, box4out2, box5out1, box5out2, box6out1, box6out2, box7out1, box7out2, box8out1, box8out2, box9out1, box9out2, box10out1, box10out2, box11out1, box11out2, box12out1, box12out2, box13out1, box13out2, box14out1, box14out2, box15out1, box15out2, box16out1, box16out2: unsigned(0 to 27);
component InitialPermutation
PORT(
	bitArray: in unsigned(0 to 63);
	outArray: out unsigned(0 to 63)
);
end component;

component split
port(
	bitArray: in unsigned(0 to 63);
	out1, out2: out unsigned(0 to 31)
);
end component;

component Box
port(
	message1, message2: in unsigned(0 to 27);
	kgenerated: in unsigned(0 to 47);
	bout1, bout2: out unsigned(0 to 31)
);
end component;

component FinalPermutation
PORT(
	bitArray1, bitArray2: in unsigned(0 to 31);
	outArray: out unsigned(0 to 63)
);
end component;

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
	-- PRIMEIRO COMPONENTE
	ip1: InitialPermutation
		port map(bitArray => message, outArray => outIp1);
	split1: split
		port map(bitArray => outIp1, out1 => split1Out1, out2 => split1Out2);
	kp1: KeyPermutation
		port map(bitArray => key(0 to 55), outArray => keypermutation1out);
	splitkey1: splitKey
		port map(keyArray => keypermutation1out, out1 => splitkey1Out1, out2 => splitkey1Out2);
	-- 1
	kg1: KeyGenerator
		port map(key1 => splitkey1Out1, key2 => splitkey1Out2, keyGenerated => keygenerator1Out, outRotation1 => br1kg1, outRotation2 => br2kg1);
	box1: Box
		port map(message1 => split1Out1, message2 => split1Out2, kgenerated => keygenerator1Out, bout1 => box1out1, bout2 => box1out2);
	-- 2
	kg2: KeyGenerator
		port map(key1 => br1kg1, key2 => br2kg1, keyGenerated => keygenerator2Out, outRotation1 => br1kg2, outRotation2 => br2kg2);
	box2: Box
		port map(message1 => box1out2, message2 => box1out1, kgenerated => keygenerator2Out, bout1 => box2out1, bout2 => box2out2);
	-- 3
	kg3: KeyGenerator
		port map(key1 => br1kg2, key2 => br2kg2, keyGenerated => keygenerator3Out, outRotation1 => br1kg3, outRotation2 => br2kg3);
	box3: Box
		port map(message1 => box2out2, message2 => box2out1, kgenerated => keygenerator3Out, bout1 => box3out1, bout2 => box3out2);
	-- 4
	kg4: KeyGenerator
		port map(key1 => br1kg3, key2 => br2kg3, keyGenerated => keygenerator4Out, outRotation1 => br1kg4, outRotation2 => br2kg4);
	box4: Box
		port map(message1 => box3out2, message2 => box3out1, kgenerated => keygenerator4Out, bout1 => box4out1, bout2 => box4out2);
	-- 5
	kg5: KeyGenerator
		port map(key1 => br1kg4, key2 => br2kg4, keyGenerated => keygenerator5Out, outRotation1 => br1kg5, outRotation2 => br2kg5);
	box5: Box
		port map(message1 => box4out2, message2 => box4out1, kgenerated => keygenerator5Out, bout1 => box5out1, bout2 => box5out2);
	-- 6
	kg6: KeyGenerator
		port map(key1 => br1kg5, key2 => br2kg5, keyGenerated => keygenerator6Out, outRotation1 => br1kg6, outRotation2 => br2kg6);
	box6: Box
		port map(message1 => box5out2, message2 => box5out1, kgenerated => keygenerator6Out, bout1 => box6out1, bout2 => box6out2);
	-- 7
	kg7: KeyGenerator
		port map(key1 => br1kg6, key2 => br2kg6, keyGenerated => keygenerator7Out, outRotation1 => br1kg7, outRotation2 => br2kg7);
	box7: Box
		port map(message1 => box6out2, message2 => box6out1, kgenerated => keygenerator7Out, bout1 => box7out1, bout2 => box7out2);
	-- 8
	kg8: KeyGenerator
		port map(key1 => br1kg7, key2 => br2kg7, keyGenerated => keygenerator8Out, outRotation1 => br1kg8, outRotation2 => br2kg8);
	box8: Box
		port map(message1 => box7out2, message2 => box7out1, kgenerated => keygenerator8Out, bout1 => box8out1, bout2 => box8out2);
	-- 9
	kg9: KeyGenerator
		port map(key1 => br1kg8, key2 => br2kg8, keyGenerated => keygenerator9Out, outRotation1 => br1kg9, outRotation2 => br2kg9);
	box9: Box
		port map(message1 => box8out2, message2 => box8out1, kgenerated => keygenerator9Out, bout1 => box9out1, bout2 => box9out2);
	-- 10
	kg10: KeyGenerator
		port map(key1 => br1kg9, key2 => br2kg9, keyGenerated => keygenerator10Out, outRotation1 => br1kg10, outRotation2 => br2kg10);
	box10: Box
		port map(message1 => box9out2, message2 => box9out1, kgenerated => keygenerator10Out, bout1 => box10out1, bout2 => box10out2);
	-- 11
	kg11: KeyGenerator
		port map(key1 => br1kg10, key2 => br2kg10, keyGenerated => keygenerator11Out, outRotation1 => br1kg11, outRotation2 => br2kg11);
	box11: Box
		port map(message1 => box10out2, message2 => box10out1, kgenerated => keygenerator11Out, bout1 => box11out1, bout2 => box11out2);
	-- 12
	kg12: KeyGenerator
		port map(key1 => br1kg11, key2 => br2kg11, keyGenerated => keygenerator12Out, outRotation1 => br1kg12, outRotation2 => br2kg12);
	box12: Box
		port map(message1 => box11out2, message2 => box11out1, kgenerated => keygenerator12Out, bout1 => box12out1, bout2 => box12out2);
	-- 13
	kg13: KeyGenerator
		port map(key1 => br1kg12, key2 => br2kg12, keyGenerated => keygenerator13Out, outRotation1 => br1kg13, outRotation2 => br2kg13);
	box13: Box
		port map(message1 => box12out2, message2 => box12out1, kgenerated => keygenerator13Out, bout1 => box13out1, bout2 => box13out2);
	-- 14
	kg14: KeyGenerator
		port map(key1 => br1kg13, key2 => br2kg13, keyGenerated => keygenerator14Out, outRotation1 => br1kg14, outRotation2 => br2kg14);
	box14: Box
		port map(message1 => box13out2, message2 => box13out1, kgenerated => keygenerator14Out, bout1 => box14out1, bout2 => box14out2);
	-- 15
	kg15: KeyGenerator
		port map(key1 => br1kg14, key2 => br2kg14, keyGenerated => keygenerator15Out, outRotation1 => br1kg15, outRotation2 => br2kg15);
	box15: Box
		port map(message1 => box14out2, message2 => box14out1, kgenerated => keygenerator15Out, bout1 => box15out1, bout2 => box15out2);
	-- 16
	kg16: KeyGenerator
		port map(key1 => br1kg15, key2 => br2kg15, keyGenerated => keygenerator16Out, outRotation1 => br1kg16, outRotation2 => br2kg16);
	box16: Box
		port map(message1 => box15out2, message2 => box15out1, kgenerated => keygenerator16Out, bout1 => box16out1, bout2 => box16out2);
	-- final permutation 1
	fp1: FinalPermutation
		port map(bitArray1 => box16out1, bitArray2 => box16out2, outArray => outfp1);
	
	-- SEGUNDO COMPONENTE
	ip2: InitialPermutation
		port map(bitArray => outfp1, outArray => outIp2);
	split2: split
		port map(bitArray => outIp2, out1 => split2Out1, out2 => split2Out2);
	kp2: KeyPermutation
		port map(bitArray => key(56 to 111), outArray => keypermutation2out);
	splitkey2: splitKey
		port map(keyArray => keypermutation2out, out1 => splitkey2Out1, out2 => splitkey2Out2);
	-- 1
	kg17: KeyGenerator
		port map(key1 => splitkey2Out1, key2 => splitkey2Out2, keyGenerated => keygenerator17Out, outRotation1 => br1kg17, outRotation2 => br2kg17);
	box17: Box
		port map(message1 => split2Out1, message2 => split2Out2, kgenerated => keygenerator17Out, bout1 => box17out1, bout2 => box17out2);
	-- 2
	kg18: KeyGenerator
		port map(key1 => br1kg17, key2 => br2kg17, keyGenerated => keygenerator18Out, outRotation1 => br1kg18, outRotation2 => br2kg18);
	box18: Box
		port map(message1 => box17out2, message2 => box17out1, kgenerated => keygenerator18Out, bout1 => box18out1, bout2 => box18out2);
	-- 3
	kg19: KeyGenerator
		port map(key1 => br1kg18, key2 => br2kg18, keyGenerated => keygenerator19Out, outRotation1 => br1kg19, outRotation2 => br2kg19);
	box19: Box
		port map(message1 => box18out2, message2 => box18out1, kgenerated => keygenerator19Out, bout1 => box19out1, bout2 => box19out2);
	-- 4
	kg20: KeyGenerator
		port map(key1 => br1kg19, key2 => br2kg19, keyGenerated => keygenerator20Out, outRotation1 => br1kg20, outRotation2 => br2kg20);
	box20: Box
		port map(message1 => box19out2, message2 => box19out1, kgenerated => keygenerator20Out, bout1 => box20out1, bout2 => box20out2);
	-- 5
	kg21: KeyGenerator
		port map(key1 => br1kg20, key2 => br2kg20, keyGenerated => keygenerator21Out, outRotation1 => br1kg21, outRotation2 => br2kg21);
	box21: Box
		port map(message1 => box20out2, message2 => box20out1, kgenerated => keygenerator21Out, bout1 => box21out1, bout2 => box21out2);
	-- 6
	kg22: KeyGenerator
		port map(key1 => br1kg21, key2 => br2kg21, keyGenerated => keygenerator22Out, outRotation1 => br1kg22, outRotation2 => br2kg22);
	box22: Box
		port map(message1 => box21out2, message2 => box21out1, kgenerated => keygenerator22Out, bout1 => box22out1, bout2 => box22out2);
	-- 7
	kg23: KeyGenerator
		port map(key1 => br1kg22, key2 => br2kg22, keyGenerated => keygenerator23Out, outRotation1 => br1kg23, outRotation2 => br2kg23);
	box23: Box
		port map(message1 => box22out2, message2 => box22out1, kgenerated => keygenerator23Out, bout1 => box23out1, bout2 => box23out2);
	-- 8
	kg24: KeyGenerator
		port map(key1 => br1kg23, key2 => br2kg23, keyGenerated => keygenerator24Out, outRotation1 => br1kg24, outRotation2 => br2kg24);
	box24: Box
		port map(message1 => box23out2, message2 => box23out1, kgenerated => keygenerator24Out, bout1 => box24out1, bout2 => box24out2);
	-- 9
	kg25: KeyGenerator
		port map(key1 => br1kg24, key2 => br2kg24, keyGenerated => keygenerator25Out, outRotation1 => br1kg25, outRotation2 => br2kg25);
	box25: Box
		port map(message1 => box24out2, message2 => box24out1, kgenerated => keygenerator25Out, bout1 => box25out1, bout2 => box25out2);
	-- 10
	kg26: KeyGenerator
		port map(key1 => br1kg25, key2 => br2kg25, keyGenerated => keygenerator26Out, outRotation1 => br1kg26, outRotation2 => br2kg26);
	box26: Box
		port map(message1 => box25out2, message2 => box25out1, kgenerated => keygenerator26Out, bout1 => box26out1, bout2 => box26out2);
	-- 11
	kg27: KeyGenerator
		port map(key1 => br1kg26, key2 => br2kg26, keyGenerated => keygenerator27Out, outRotation1 => br1kg27, outRotation2 => br2kg27);
	box27: Box
		port map(message1 => box26out2, message2 => box26out1, kgenerated => keygenerator27Out, bout1 => box27out1, bout2 => box27out2);
	-- 12
	kg28: KeyGenerator
		port map(key1 => br1kg27, key2 => br2kg27, keyGenerated => keygenerator28Out, outRotation1 => br1kg28, outRotation2 => br2kg28);
	box28: Box
		port map(message1 => box27out2, message2 => box27out1, kgenerated => keygenerator28Out, bout1 => box28out1, bout2 => box28out2);
	-- 13
	kg29: KeyGenerator
		port map(key1 => br1kg28, key2 => br2kg28, keyGenerated => keygenerator29Out, outRotation1 => br1kg29, outRotation2 => br2kg29);
	box29: Box
		port map(message1 => box28out2, message2 => box28out1, kgenerated => keygenerator29Out, bout1 => box29out1, bout2 => box29out2);
	-- 14
	kg30: KeyGenerator
		port map(key1 => br1kg29, key2 => br2kg29, keyGenerated => keygenerator30Out, outRotation1 => br1kg30, outRotation2 => br2kg30);
	box30: Box
		port map(message1 => box29out2, message2 => box29out1, kgenerated => keygenerator30Out, bout1 => box30out1, bout2 => box30out2);
	-- 15
	kg31: KeyGenerator
		port map(key1 => br1kg30, key2 => br2kg30, keyGenerated => keygenerator31Out, outRotation1 => br1kg31, outRotation2 => br2kg31);
	box31: Box
		port map(message1 => box30out2, message2 => box30out1, kgenerated => keygenerator31Out, bout1 => box31out1, bout2 => box31out2);
	-- 16
	kg32: KeyGenerator
		port map(key1 => br1kg31, key2 => br2kg31, keyGenerated => keygenerator32Out, outRotation1 => br1kg32, outRotation2 => br2kg32);
	box32: Box
		port map(message1 => box31out2, message2 => box31out1, kgenerated => keygenerator32Out, bout1 => box32out1, bout2 => box32out2);
	-- final permutation 1
	fp2: FinalPermutation
		port map(bitArray1 => box32out1, bitArray2 => box32out2, outArray => outfp2);
end comportamento;