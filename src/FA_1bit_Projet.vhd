Library IEEE;
use ieee.std_logic_1164.all;


-- Un additionneur complet 1 bit a 3 entrées (a, b, et cin la retenue entrante)
-- Et 2 sorties (le bit de somme s et le bit de retenue sortante cout).
ENTITY FA_1bit_Projet IS
	PORT ( 
		a, b, cin : in std_logic;
		cout, s: out std_logic 
	);
END ENTITY;


ARCHITECTURE archi_FA_1bit_Projet OF FA_1bit_Projet IS
	BEGIN
		s <= a XOR b XOR cin;
		cout <= (a AND b) OR (a AND cin) OR (cin AND b);
END ARCHITECTURE;