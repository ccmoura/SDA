LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY CarrySelector_TB_vhd IS
END CarrySelector_TB_vhd;

ARCHITECTURE comportamento OF CarrySelector_TB_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT CarrySelector 
	PORT (
		A : in std_logic_vector (0 to 31);
		B : in std_logic_vector (0 to 31);
		CinS : in std_logic;
		S : out std_logic_vector (0 to 31);
		CoutS : out std_logic
	);
	END COMPONENT;

	--Inputs
	SIGNAL input_a :  std_logic_vector(0 to 31) := (others=>'0');
	SIGNAL input_b :  std_logic_vector(0 to 31) := (others=>'0');

	--Outputs
	SIGNAL c_in :  std_logic;
	SIGNAL c_out :  std_logic;	-- ready
	SIGNAL s_out :  std_logic_vector(0 to 31); -- sqrt
	
	SIGNAL clk :  std_logic := '0';
	SIGNAL rst :  std_logic := '0';
	SIGNAL counter :  std_logic_vector(0 to 31) := (others=>'0');
	SIGNAL counter2 :  std_logic_vector(0 to 31) := (others=>'0');

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: CarrySelector PORT MAP(
		A => input_a,
		B => input_b,
		S => s_out,
		CinS => c_in,
		CoutS => c_out
	);

	Clock :PROCESS 
	BEGIN
  		clk <= '1', '0' AFTER 5 ns;
  		WAIT FOR 10 ns;
	END PROCESS;
	tb : PROCESS
	BEGIN
		c_in <= '0';
		rst <= '1';
		-- Wait 100 ns for global reset to finish
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		
		rst <= '0';
		while (counter <= "11111111111111111111111111111111") loop
				   input_a <= counter(0 to 31);
					wait until falling_edge(clk);
				   counter <= counter xor "00000000000000000000000000000001";
					while (counter2 <= "11111111111111111111111111111111") loop
						input_b <= counter2(0 to 31);
						wait until falling_edge(clk);
						counter2 <= counter2 xor "00000000000000000000000000000001";
					END LOOP;
		END LOOP;


		wait; -- will wait forever
	END PROCESS;

END;