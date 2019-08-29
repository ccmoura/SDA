LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ula IS 
PORT (
    funct: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    A, B: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
);
END ula;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY register5 IS 
PORT (
    D : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    LD: IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
);
END register5;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY mux IS
PORT (
	r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, 
	r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, 
	r29, r30, r31, r32 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	sel : IN STD_LOGIC_VECTOR(4 downto 0);
	saidaMux : OUT std_LOGIC_VECTOR(4 DOWNTO 0)
	
);
END mux;

ARCHITECTURE comportamento OF mux IS
   
BEGIN
	WITH sel SELECT saidaMux <= 
		r1 WHEN "00000",	-- 0
		r2 WHEN "00001",	-- 1
		r3 WHEN "00010",	-- 2
		r4 WHEN "00011",	-- 3
		r5 WHEN "00100",	-- 4
		r6 WHEN "00101",	-- 5
		r7 WHEN "00110",	-- 6
		r8 WHEN "00111",
		r9 WHEN "01000",
		r10 WHEN "01001",
		r11 WHEN "01010",
		r12 WHEN "01011",
		r13 WHEN "01100",
		r14 WHEN "01101",
		r15 WHEN "01110",
		r16 WHEN "01111",
		r17 WHEN "10000",
		r18 WHEN "10001",
		r19 WHEN "10010",
		r20 WHEN "10011",
		r21 WHEN "10100",
		r22 WHEN "10101",	-- 21
		r23 WHEN "10110", -- 22
		r24 WHEN "10111",
		r25 WHEN "11000",	-- 24
		r26 WHEN "11001",
		r27 WHEN "11010",
		r28 WHEN "11011",
		r29 WHEN "11100",
		r30 WHEN "11101",
		r31 WHEN "11110",
		r32 WHEN "11111",	-- 31
		"00000" WHEN OTHERS;
		
END comportamento;

ARCHITECTURE comportamento OF ula IS
BEGIN 
    PROCESS(funct, A, B)
    BEGIN
        CASE funct IS
            WHEN "000000" => o <= "00000";
            WHEN "000001" => o <= B - A;
            WHEN "000010" => o <= A - B;
            WHEN "000011" => o <= A + B;
            WHEN "000100" => o <= A XOR B;
            WHEN "000101" => o <= A OR B;
            WHEN "000110" => o <= A AND B;
            WHEN OTHERS => o <= "11111";
        END CASE;
    END PROCESS;
END comportamento;

ARCHITECTURE comportamento OF register5 IS
    
BEGIN
    PROCESS(CLK)
    BEGIN
        IF CLK'event and CLK = '1' THEN
            IF LD = '1' THEN
                Q <= D;
            END IF;
        END IF;
    END PROCESS;
END comportamento;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY chip IS
PORT (
	-- entradas de registradores
	r1c, r2c, r3c, r4c, r5c, r6c, r7c, r8c, r9c, r10c, r11c, r12c, r13c, r14c, r15c, 
	r16c, r17c, r18c, r19c, r20c, r21c, r22c, r23c, r24c, r25c, r26c, r27c, r28c, 
	r29c, r30c, r31c, r32c : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	-- instrução de 32 bits
	instrucao : IN STD_LOGIC_VECTOR(0 to 31);
	-- LD dos registradores
	LD1c, LD2c, LD3c, LD4c, LD5c, LD6c, LD7c, LD8c, LD9c, LD10c, LD11c, LD12c, LD13c, LD14c, LD15c, LD16c, 
	LD17c, LD18c, LD19c, LD20c, LD21c, LD22c, LD23c, LD24c, LD25c, LD26c, LD27c, LD28c, LD29c, LD30c, LD31c, 
	LD32c : IN STD_LOGIC;
	-- CLK dos registradores
   CLK1c, CLK2c, CLK3c, CLK4c, CLK5c, CLK6c, CLK7c, CLK8c, CLK9c, CLK10c, CLK11c, CLK12c, CLK13c, CLK14c, CLK15c, CLK16c, 
	CLK17c, CLK18c, CLK19c, CLK20c, CLK21c, CLK22c, CLK23c, CLK24c, CLK25c, CLK26c, CLK27c, CLK28c, CLK29c, CLK30c, CLK31c, 
	CLK32c : IN STD_LOGIC;
	-- saida
	saidac : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
);
END chip;

ARCHITECTURE comportamento OF chip IS
signal temp1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal temp2 : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal temp3, temp4, temp5, temp6, temp7, temp8,
 temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24,
 temp25, temp26, temp27, temp28, temp29, temp30, temp31, temp32, temp33, temp34 : STD_LOGIC_VECTOR (4 DOWNTO 0);
COMPONENT ulac
PORT (
	funct: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
   A, B: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
   o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
); 
END COMPONENT;
COMPONENT muxc
PORT (
	r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, 
	r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, 
	r29, r30, r31, r32 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	sel : IN STD_LOGIC_VECTOR(4 downto 0);
	saidaMux : std_LOGIC_VECTOR(4 DOWNTO 0)
);
END COMPONENT;
COMPONENT registerc
PORT (
    D : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    LD: IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
);
END COMPONENT;

BEGIN
	rg1 : registerc PORT MAP(r1c, LD1c, CLK1c, temp3);
	rg2 : registerc PORT MAP(r2c, LD2c, CLK2c, temp4);
	rg3 : registerc PORT MAP(r3c, LD3c, CLK3c, temp5);
	rg4 : registerc PORT MAP(r4c, LD4c, CLK4c, temp6);
	rg5 : registerc PORT MAP(r5c, LD5c, CLK5c, temp7);
	rg6 : registerc PORT MAP(r6c, LD6c, CLK6c, temp8);
	rg7 : registerc PORT MAP(r7c, LD7c, CLK7c, temp9);
	rg8 : registerc PORT MAP(r8c, LD8c, CLK8c, temp10);
	rg9 : registerc PORT MAP(r9c, LD9c, CLK9c, temp11);
	rg10 : registerc PORT MAP(r10c, LD10c, CLK10c, temp12);
	rg11 : registerc PORT MAP(r11c, LD11c, CLK11c, temp13);
	rg12 : registerc PORT MAP(r12c, LD12c, CLK12c, temp14);
	rg13 : registerc PORT MAP(r13c, LD13c, CLK13c, temp15);
	rg14 : registerc PORT MAP(r14c, LD14c, CLK14c, temp16);
	rg15 : registerc PORT MAP(r15c, LD15c, CLK15c, temp17);
	rg16 : registerc PORT MAP(r16c, LD16c, CLK16c, temp18);
	rg17 : registerc PORT MAP(r17c, LD17c, CLK17c, temp19);
	rg18 : registerc PORT MAP(r18c, LD18c, CLK18c, temp20);
	rg19 : registerc PORT MAP(r19c, LD19c, CLK19c, temp21);
	rg20 : registerc PORT MAP(r20c, LD20c, CLK20c, temp22);
	rg21 : registerc PORT MAP(r21c, LD21c, CLK21c, temp23);
	rg22 : registerc PORT MAP(r22c, LD22c, CLK22c, temp24);
	rg23 : registerc PORT MAP(r23c, LD23c, CLK23c, temp25);
	rg24 : registerc PORT MAP(r24c, LD24c, CLK24c, temp26);
	rg25 : registerc PORT MAP(r25c, LD25c, CLK25c, temp27);
	rg26 : registerc PORT MAP(r26c, LD26c, CLK26c, temp28);
	rg27 : registerc PORT MAP(r27c, LD27c, CLK27c, temp29);
	rg28 : registerc PORT MAP(r28c, LD28c, CLK28c, temp30);
	rg29 : registerc PORT MAP(r29c, LD29c, CLK29c, temp31);
	rg30 : registerc PORT MAP(r30c, LD30c, CLK30c, temp32);
	rg31 : registerc PORT MAP(r31c, LD31c, CLK31c, temp33);
	rg32 : registerc PORT MAP(r32c, LD32c, CLK32c, temp34);

	mux0 : muxc PORT MAP(temp3, temp4, temp5, temp6, temp7, temp8,
 temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24,
 temp25, temp26, temp27, temp28, temp29, temp30, temp31, temp32, temp33, temp34,
	instrucao(6 to 10), temp1);
	
	mux1 : muxc PORT MAP(temp3, temp4, temp5, temp6, temp7, temp8,
 temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24,
 temp25, temp26, temp27, temp28, temp29, temp30, temp31, temp32, temp33, temp34,
	instrucao(11 to 15), temp2);
	
	ula0c : ulac PORT MAP (instrucao(26 to 31), temp1, temp2, saidac);
	
END comportamento;