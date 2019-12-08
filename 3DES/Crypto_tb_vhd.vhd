library IEEE;
USE ieee.std_logic_1164.all;
use STD.textio.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
ENTITY Crypto_tb_vhd IS
END Crypto_tb_vhd;

architecture comportamento of Crypto_tb_vhd is  
component Crypto
PORT(
	message: in unsigned(0 to 63);
	key: in unsigned(0 to 191);
	result : out unsigned(0 to 63)
);
end component;
component Decrypto
PORT(
	message: in unsigned(0 to 63);
	key: in unsigned(0 to 191);
	result : out unsigned(0 to 63)
);
end component;

FILE OUTFILE, INFILE, OUTFILE2 : TEXT;
signal fileMessage, resultCrypto, resultDecrypto : unsigned(0 to 63);
signal fileKey : unsigned(0 to 191);
begin
	uut: Crypto
		port map(message => fileMessage, key => fileKey, result => resultCrypto);
	uut2: Decrypto
		port map(message => resultCrypto, key => fileKey, result => resultDecrypto);
		
	process
		VARIABLE oL, oL2, iL : LINE;
		variable cSPACE     : character;
		VARIABLE M, M2 : std_logic_vector(0 to 63);
		VARIABLE K : std_logic_vector(0 to 191);
		begin
		file_open(INFILE, "input.txt",  read_mode);
		file_open(OUTFILE, "encrypted.txt", write_mode);
		file_open(OUTFILE2, "decrypted.txt", write_mode);
	 while not endfile(INFILE) loop
		readline(INFILE, iL);
      read(iL, M);
      read(iL, cSPACE);
      read(iL, K);
		
		fileMessage <= unsigned(M);
		fileKey <= unsigned(K);
		
		wait for 1500 ns;
		
		write(oL, std_logic_vector(resultCrypto));
		writeline(OUTFILE, oL);
		wait for 1500 ns;
		write(oL2, std_logic_vector(resultDecrypto));
		writeline(OUTFILE2, oL2);
		
		wait;
	end loop;
	file_close(INFILE);
	file_close(OUTFILE);
	file_close(OUTFILE2);
	end process;
end comportamento;