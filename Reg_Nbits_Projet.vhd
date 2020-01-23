Library IEEE ;
USE ieee.std_logic_1164.all;

-- Entité Registre 10 bits
ENTITY Reg_Nbits_Projet IS
	GENERIC ( N : INTEGER := 10 );
	PORT (
	    D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		Q : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		Set, CLK, Reset : IN STD_LOGIC
	);
END ENTITY Reg_Nbits_Projet;


-- Architecture Registre 10 bits
ARCHITECTURE archi_Reg_Nbits_Projet OF Reg_Nbits_Projet IS 

COMPONENT Reg1bit_Projet IS
	PORT ( 
	CLK, D, Set, Reset : IN STD_LOGIC;
    Q : OUT STD_LOGIC
	); 
END COMPONENT Reg1bit_Projet;

BEGIN
	GEN : FOR i IN 0 TO N-1 GENERATE
		Reg1 : Reg1bit_Projet port map ( Reset => Reset, CLK => CLK, Set => Set, D=> D(i),Q=> Q(i) );
    END GENERATE GEN;	
    
END ARCHITECTURE;		



