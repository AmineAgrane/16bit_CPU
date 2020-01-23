LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU is
GENERIC ( n : integer := 10 );
	PORT ( 	
		A: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		B: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		instruction: IN STD_LOGIC;
		resultat: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		overflow: OUT STD_LOGIC );
END ALU;

ARCHITECTURE archi_ALU OF ALU IS

	-- On déclare le componenet du full adder
	COMPONENT FA_Nbit_Projet
		GENERIC ( n : integer := 10 );
		PORT ( 
		a,b: IN STD_LOGIC_VECTOR(n-1 downto 0);
		cin: IN STD_LOGIC;
		cout: OUT STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0) );
	 END COMPONENT;
	 
	 
	 SIGNAL BT, Binv, BCompl: STD_LOGIC_VECTOR(9 DOWNTO 0);
	 SIGNAL overflow1: STD_LOGIC;
	 
	BEGIN
	 
   -- Au début, on calcule Complémentaire(B)+1 et on le met dans BCompl
   -- Si c'est une addition, on fait resultat <= A + B
   -- Si c'est une soustraction, on fait resultat <= A + Complémentaire(B) + 1

    -- On calcule Complémentraire(B)+1
	Binv <= (b XOR "1111111111"); 	-- Binv <= NOT(B);
	
	addTmp: FA_Nbit_Projet
	GENERIC MAP (10)
	PORT MAP (Binv, "0000000001", '0', overflow1, BCompl); 
	 
	--BT <= B WHEN instruction(0)='0' ELSE (BCompl);
	BT <= b WHEN instruction='0' ELSE (BCompl);

	addSub: FA_Nbit_Projet
	GENERIC MAP (10)
	PORT MAP (A, BT, '0', overFlow, resultat);
		
		
END ARCHITECTURE;