library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Box IS
port(
	message1, message2: in unsigned(0 to 27);
	kgenerated: in unsigned(0 to 47);
	bout1, bout2: out unsigned(0 to 27)
);
end Box;
architecture comportamento of Box is  
signal expansionBuffer : unsigned(0 to 47);
signal expansionBufferProcessed : unsigned(0 to 31);
begin
	-- expansao
	expansionBuffer(0) <= message2(31);
	expansionBuffer(1) <= message2(0);
	expansionBuffer(2) <= message2(1);
	expansionBuffer(3) <= message2(2);
	expansionBuffer(4) <= message2(3);
	expansionBuffer(5) <= message2(4);
	expansionBuffer(6) <= message2(3);
	expansionBuffer(7) <= message2(4);
	expansionBuffer(8) <= message2(5);
	expansionBuffer(9) <= message2(6);
	expansionBuffer(10) <= message2(7);
	expansionBuffer(11) <= message2(8);
	expansionBuffer(12) <= message2(7);
	expansionBuffer(13) <= message2(8);
	expansionBuffer(14) <= message2(9);
	expansionBuffer(15) <= message2(10);
	expansionBuffer(16) <= message2(11);
	expansionBuffer(17) <= message2(12);
	expansionBuffer(18) <= message2(11);
	expansionBuffer(19) <= message2(12);
	expansionBuffer(20) <= message2(13);
	expansionBuffer(21) <= message2(14);
	expansionBuffer(22) <= message2(15);
	expansionBuffer(23) <= message2(16);
	expansionBuffer(24) <= message2(15);
	expansionBuffer(25) <= message2(16);
	expansionBuffer(26) <= message2(17);
	expansionBuffer(27) <= message2(18);
	expansionBuffer(28) <= message2(19);
	expansionBuffer(29) <= message2(20);
	expansionBuffer(30) <= message2(19);
	expansionBuffer(31) <= message2(20);
	expansionBuffer(32) <= message2(21);
	expansionBuffer(33) <= message2(22);
	expansionBuffer(34) <= message2(23);
	expansionBuffer(35) <= message2(24);
	expansionBuffer(36) <= message2(23);
	expansionBuffer(37) <= message2(24);
	expansionBuffer(38) <= message2(25);
	expansionBuffer(39) <= message2(26);
	expansionBuffer(40) <= message2(27);
	expansionBuffer(41) <= message2(28);
	expansionBuffer(42) <= message2(27);
	expansionBuffer(43) <= message2(28);
	expansionBuffer(44) <= message2(29);
	expansionBuffer(45) <= message2(30);
	expansionBuffer(46) <= message2(31);
	expansionBuffer(47) <= message2(0);
	
	-- xor com a subchave
	expansionBuffer <= kgenerated xor expansionBuffer;
	
	-- s1
	process (expansionBuffer(0 to 5)) is
	begin
		case expansionBuffer(0 to 5) is
			when "000000" => expansionBufferProcessed(0 to 3) <= "1110";
			when "000001" => expansionBufferProcessed(0 to 3) <= "0000";
			when "000010" => expansionBufferProcessed(0 to 3) <= "0100";
			when "000011" => expansionBufferProcessed(0 to 3) <= "1111";
			when "000100" => expansionBufferProcessed(0 to 3) <= "1101";
			when "000101" => expansionBufferProcessed(0 to 3) <= "0111";
			when "000110" => expansionBufferProcessed(0 to 3) <= "0001";
			when "000111" => expansionBufferProcessed(0 to 3) <= "0100";
			when "001000" => expansionBufferProcessed(0 to 3) <= "0010";
			when "001001" => expansionBufferProcessed(0 to 3) <= "1110";
			when "001010" => expansionBufferProcessed(0 to 3) <= "1111";
			when "001011" => expansionBufferProcessed(0 to 3) <= "0010";
			when "001100" => expansionBufferProcessed(0 to 3) <= "1011";
			when "001101" => expansionBufferProcessed(0 to 3) <= "1101";
			when "001110" => expansionBufferProcessed(0 to 3) <= "1000";
			when "001111" => expansionBufferProcessed(0 to 3) <= "0001";
			when "010000" => expansionBufferProcessed(0 to 3) <= "0011";
			when "010001" => expansionBufferProcessed(0 to 3) <= "1010";
			when "010010" => expansionBufferProcessed(0 to 3) <= "1010";
			when "010011" => expansionBufferProcessed(0 to 3) <= "0110";
			when "010100" => expansionBufferProcessed(0 to 3) <= "0110";
			when "010101" => expansionBufferProcessed(0 to 3) <= "1100";
			when "010110" => expansionBufferProcessed(0 to 3) <= "1100";
			when "010111" => expansionBufferProcessed(0 to 3) <= "1011";
			when "011000" => expansionBufferProcessed(0 to 3) <= "0101";
			when "011001" => expansionBufferProcessed(0 to 3) <= "1001";
			when "011010" => expansionBufferProcessed(0 to 3) <= "1001";
			when "011011" => expansionBufferProcessed(0 to 3) <= "0101";
			when "011100" => expansionBufferProcessed(0 to 3) <= "0000";
			when "011101" => expansionBufferProcessed(0 to 3) <= "0011";
			when "011110" => expansionBufferProcessed(0 to 3) <= "0111";
			when "011111" => expansionBufferProcessed(0 to 3) <= "1000";
			when "100000" => expansionBufferProcessed(0 to 3) <= "0100";
			when "100001" => expansionBufferProcessed(0 to 3) <= "1111";
			when "100010" => expansionBufferProcessed(0 to 3) <= "0001";
			when "100011" => expansionBufferProcessed(0 to 3) <= "1100";
			when "100100" => expansionBufferProcessed(0 to 3) <= "1110";
			when "100101" => expansionBufferProcessed(0 to 3) <= "1000";
			when "100110" => expansionBufferProcessed(0 to 3) <= "1000";
			when "100111" => expansionBufferProcessed(0 to 3) <= "0010";
			when "101000" => expansionBufferProcessed(0 to 3) <= "1101";
			when "101001" => expansionBufferProcessed(0 to 3) <= "0100";
			when "101010" => expansionBufferProcessed(0 to 3) <= "0110";
			when "101011" => expansionBufferProcessed(0 to 3) <= "1001";
			when "101100" => expansionBufferProcessed(0 to 3) <= "0010";
			when "101101" => expansionBufferProcessed(0 to 3) <= "0001";
			when "101110" => expansionBufferProcessed(0 to 3) <= "1011";
			when "101111" => expansionBufferProcessed(0 to 3) <= "0111";
			when "110000" => expansionBufferProcessed(0 to 3) <= "1111";
			when "110001" => expansionBufferProcessed(0 to 3) <= "0101";
			when "110010" => expansionBufferProcessed(0 to 3) <= "1100";
			when "110011" => expansionBufferProcessed(0 to 3) <= "1011";
			when "110100" => expansionBufferProcessed(0 to 3) <= "1001";
			when "110101" => expansionBufferProcessed(0 to 3) <= "0011";
			when "110110" => expansionBufferProcessed(0 to 3) <= "0111";
			when "110111" => expansionBufferProcessed(0 to 3) <= "1110";
			when "111000" => expansionBufferProcessed(0 to 3) <= "0011";
			when "111001" => expansionBufferProcessed(0 to 3) <= "1010";
			when "111010" => expansionBufferProcessed(0 to 3) <= "1010";
			when "111011" => expansionBufferProcessed(0 to 3) <= "0000";
			when "111100" => expansionBufferProcessed(0 to 3) <= "0101";
			when "111101" => expansionBufferProcessed(0 to 3) <= "0110";
			when "111110" => expansionBufferProcessed(0 to 3) <= "0000";
			when "111111" => expansionBufferProcessed(0 to 3) <= "1101";
			when others => expansionBufferProcessed(0 to 3) <= "0000";
		end case;
	end process;
end comportamento;