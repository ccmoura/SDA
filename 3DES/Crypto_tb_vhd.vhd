library IEEE;
USE ieee.std_logic_1164.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
ENTITY Crypto_tb_vhd IS
END Crypto_tb_vhd;

architecture comportamento of Crypto_tb_vhd is  
component Crypto
PORT(
	c: in std_logic;
	message: in unsigned(0 to 63);
	key: in unsigned(0 to 191);
	result : out unsigned(0 to 63)
);
end component;
FILE OUTFILE, INFILE : TEXT;
signal fileMessage, resultCrypto : unsigned(0 to 63);
signal fileKey : unsigned(0 to 191);
begin
	uut: Crypto
		port map(c => encrypt, message => fileMessage, key => fileKey, result => resultCrypto);
		
	process
		VARIABLE oL, iL : LINE;
		variable cSPACE     : character;
		VARIABLE M : unsigned(0 to 63);
		VARIABLE K : unsigned(0 to 63);
		begin
		file_open(INFILE, "input.txt",  read_mode);
		file_open(OUTFILE, "output.txt", write_mode);
	 while not endfile(INFILE) loop
		readline(INFILE, iL);
      read(iL, M);
      read(iL, cSPACE);
      read(iL, K);
		
		fileMessage <= M;
		fileKey <= K;
		
		wait for 300 ns;
		
		write(oL, resultCrypto);
		writeline(OUTFILE, oL);
	end loop;
	file_close(INFILE);
	file_close(OUTFILE);
	end process;
end comportamento;