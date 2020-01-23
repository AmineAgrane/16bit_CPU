Library IEEE;
use ieee.std_logic_1164.all;

ENTITY Mux2v1_Nbit_Projet IS
	GENERIC ( N : integer := 8 );
	PORT ( 
		X, Y : in STD_LOGIC_vector(N-1 downto 0);
		S : in std_logic;
		M : out STD_LOGIC_vector(N-1 downto 0) 
	);
END ENTITY;

ARCHITECTURE archi_Mux2v1_Nbit_Projet OF Mux2v1_Nbit_Projet IS
    -- On déclare Mux2v1_1bit
	COMPONENT Mux2v1_1bit_Projet IS
	PORT ( 
		X,Y,S: IN STD_LOGIC;
		M : OUT STD_LOGIC 
	);
	END COMPONENT;
	
	BEGIN
		GEN4 : FOR i IN 0 to N-1 GENERATE
			MUX2V1 : Mux2v1_1bit_Projet				
				PORT MAP ( X=>X(i), Y=>Y(i), S=>S, M=>M(i) );
		END GENERATE;
		
END ARCHITECTURE;