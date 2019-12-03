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
signal keygenerator1Out, keygenerator2Out, keygenerator3Out, keygenerator4Out : unsigned(0 to 47);
signal br1kg1, br2kg1, br1kg2, br2kg2  : unsigned(0 to 27);
signal box1out1, box1out2, box2out1, box2out2 : unsigned(0 to 27);
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
	bout1, bout2: out unsigned(0 to 27)
);
end component;

component FinalPermutation
PORT(
	bitArray1, bitArray2: in unsigned(0 to 31);
	outArray: out unsigned(0 to 31)
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
	-- primeiro componente
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
end comportamento;