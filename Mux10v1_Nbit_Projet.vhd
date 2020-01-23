Library IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY Mux10v1_Nbit_Projet IS
 GENERIC ( N : integer := 16 );
 PORT (
	DIN, G, R0,R1,R2,R3,R4,R5,R6,R7 : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);	
	Bus_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Bus_Data : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
	 );
	 
END ENTITY;


ARCHITECTURE archi_Mux10v1_Nbit_Projet OF Mux10v1_Nbit_Projet IS 

COMPONENT Mux10v1_1bit_Projet IS 
    PORT (
	DIN,G,R0,R1,R2,R3,R4,R5,R6,R7 : IN STD_LOGIC;	
	Bus_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Bus_Data : OUT STD_LOGIC
	 );
END COMPONENT;
	
	BEGIN
		GEN3 : FOR i IN 0 TO N-1 GENERATE
			Mux : Mux10v1_1bit_Projet
				PORT MAP (
					DIN => DIN(i),
					G => G(i),
					R0 => R0(i),
					R1 => R1(i),
					R2 => R2(i),
					R3 => R3(i),
					R4 => R4(i),
					R5 => R5(i),
					R6 => R6(i),
					R7 => R7(i),
					Bus_Select => Bus_Select,
					Bus_Data => Bus_Data(i)
				);
		END GENERATE;
END ARCHITECTURE ;

	