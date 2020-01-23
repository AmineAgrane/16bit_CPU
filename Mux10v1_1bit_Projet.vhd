Library IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;


-- 10 entrées
-- Selon la valeur de Bus_select on remplit Bus_data
ENTITY Mux10v1_1bit_Projet IS
	PORT (
	DIN,G,R0,R1,R2,R3,R4,R5,R6,R7 : IN STD_LOGIC;	
	Bus_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Bus_Data : OUT STD_LOGIC
	 );
END ENTITY Mux10v1_1bit_Projet;

ARCHITECTURE archi_Mux1bit_Projet OF Mux10v1_1bit_Projet IS
  BEGIN
    PROCESS(Bus_Select)
       BEGIN
	      CASE Bus_Select IS
   		    WHEN "0000" => Bus_Data <= R0;  
		    WHEN "0001" => Bus_Data <= R1; 
		    WHEN "0010" => Bus_Data <= R2; 
		    WHEN "0011" => Bus_Data <= R3; 
		    WHEN "0100" => Bus_Data <= R4; 
		    WHEN "0101" => Bus_Data <= R5; 
		    WHEN "0110" => Bus_Data <= R6; 
		    WHEN "0111" => Bus_Data <= R7; 
		    WHEN "1000" => Bus_Data <= DIN; 
		    WHEN "1001" => Bus_Data <= G;
	        WHEN OTHERS => NULL;
	       END CASE;
    END PROCESS;
END ARCHITECTURE;
