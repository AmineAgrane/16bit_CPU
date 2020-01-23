Library IEEE;
use ieee.std_logic_1164.all;

-- Multiplexeur 2v1
-- S=0  => X | S=1 => Y
ENTITY Mux2v1_1bit_Projet IS
	PORT ( 
		X,Y,S: IN STD_LOGIC;
		M : OUT STD_LOGIC 
	);
END ENTITY;

ARCHITECTURE archi_Mux2v1_1bit_Projet OF Mux2v1_1bit_Projet IS
	BEGIN
		M <= (NOT (S) AND X) OR (S AND Y);
END ARCHITECTURE;