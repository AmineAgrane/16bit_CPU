Library IEEE ;
USE ieee.std_logic_1164.all;

ENTITY Reg1bit_Projet IS
PORT ( 
	CLK, D, Set, Reset : IN STD_LOGIC;
    Q : OUT STD_LOGIC
	); 
END Reg1bit_Projet;

-- Architecture du registre 1 bit
-- Reset Asynchrone => Si actif Q mis à 0
-- Enable Synchrone => Mise a jour de Q UNIQUEMENT sur front montant et Set='1'
ARCHITECTURE archi_Reg1bit_Projet OF Reg1bit_Projet IS
BEGIN
	PROCESS(CLK, Reset)
	BEGIN
		IF Reset='0' THEN
			Q <= '0';
		ELSIF (CLK'EVENT AND CLK='1') THEN
				IF Set='1' THEN
					Q <= D;
				END IF;
		END IF;
	END PROCESS;	
END ARCHITECTURE;
