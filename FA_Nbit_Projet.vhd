Library IEEE;
use ieee.std_logic_1164.all;

ENTITY FA_Nbit_Projet is
	GENERIC ( n : integer := 4 );
	PORT ( 
		a,b: IN STD_LOGIC_VECTOR(n-1 downto 0);
		cin: IN STD_LOGIC;
		cout: OUT STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE archi_FA_Nbit_Projet  OF FA_Nbit_Projet  IS
-- On déclare l'additionneur 1 bit
	COMPONENT FA_1bit_Projet IS
		PORT ( 
			a, b, cin : in STD_LOGIC;
			cout, s: out STD_LOGIC 
		);
	END COMPONENT;
	
-- les instances des additionneurs 1 bit sont reliés entre eux
-- la retenue sortante de l'un est la retenue entrante du suivant	
	SIGNAL c_s : std_logic_vector(n downto 0);
	
	begin		
		c_s(0) <= cin;
	
		GEN5 : FOR i in 0 to n-1 GENERATE
			fa_1bit : FA_1bit_Projet
			PORT MAP ( a => a(i), b => b(i), cin => c_s(i), s => s(i), cout => c_s(i+1) );
		END GENERATE;
		
		cout <= c_s(n);
		
END ARCHITECTURE;
