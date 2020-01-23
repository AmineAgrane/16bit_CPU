LIBRARY ieee;
USE ieee.std_logic_1164.all;


-- Entité de la FSM
ENTITY FSM is
	PORT ( 
		IR : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		BusSel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		Add_sub : OUT STD_LOGIC;
		irs, r0s, r1s, r2s, r3s, r4s, r5s, r6s, r7s, as, gs: out std_logic; 
		clk, reset_n,	run:	in std_logic;
		done	:	OUT STD_LOGIC);
END ENTITY;

-- Les opérations Mov Rx Di et Mov Rx Ry se font directemet, le done est mis à 1 juste apres
-- Pour les additions et soustractions, leurs executions nécéssite un ensemble d'instruction réparti sur plusieurs
-- cycles d'horloge.Plusieurs déplacements de données sont	nécessaires	pour les	réaliser.

ARCHITECTURE archi_FSM OF FSM IS
	TYPE etat is(initial, etat1, etat2, etat3);
	SIGNAL etat_courant, etat_futur: etat;
	SIGNAL instruction, RX, RY: STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	
BEGIN
	p_state: PROCESS(etat_courant, IR, RX, RY)
	BEGIN
  	   -- On décompose la commande
		instruction<= IR(8 DOWNTO 6);
		RX <= IR(5 DOWNTO 3);
		RY <= IR(2 DOWNTO 0);
	
		case etat_courant is
			WHEN initial=>
				-- On active le registre IR
				-- On mets DIN dans le MUX
				-- Ainsi, le contenu de Din est mis dans IR
				done <= '0';
				irs<='1';
				r0s<='0'; r1s<='0'; r2s<='0'; r3s<='0';
				r4s<='0'; r5s<='0'; r6s<='0'; r7s<='0';
				as<='0'; gs<='0';
				BusSel<= "1000";
				etat_futur<=etat1;


			WHEN etat1=>			
				r0s<='0'; r1s<='0'; r2s<='0'; r3s<='0';
				r4s<='0'; r5s<='0'; r6s<='0'; r7s<='0';
				as<='0'; gs<='0'; irs<='0';
				if(instruction="000") then	
				    -- Instruction : Mov Rx Din;
					-- D'abord on active le registre Rx correspondant, ensuite met Din dans le mux 
				   CASE RX IS
				   WHEN "000" => r0s <= '1';
					WHEN "001" => r1s <= '1';
					WHEN "010" => r2s <= '1';
					WHEN "011" => r3s <= '1';
					WHEN "100" => r4s <= '1';
					WHEN "101" => r5s <= '1';
					WHEN "110" => r6s <= '1';
					WHEN "111" => r7s <= '1';
				   END CASE;

				    BusSel <= "1000"; 
				    done<='1';					
					etat_futur<=initial;
					
				else if(instruction="001") then 
				    -- Instruction : Mov Rx Ry;
					-- D'abord on active le registre Rx correspondant, puis on met RY dans le mux
					CASE RX IS
				   WHEN "000" => r0s <= '1';
					WHEN "001" => r1s <= '1';
					WHEN "010" => r2s <= '1';
					WHEN "011" => r3s <= '1';
					WHEN "100" => r4s <= '1';
					WHEN "101" => r5s <= '1';
					WHEN "110" => r6s <= '1';
					WHEN "111" => r7s <= '1';
				   END CASE;
				    
				    BusSel<='0'&RY;
				    done<='1';       	        	
					etat_futur<=initial;
					
				else if(instruction="100") then -- Instruction : Add Rx Ry;
					-- est ce qu'on met les autres set à 0 ?
					-- On met Rx dans A
					done <= '0';
					as<='1';					
					BusSel<='0'&RX;							
					Add_sub <= '0';							
					etat_futur<=etat2;
				else if(instruction="101") then -- Instruction : Sub Rx Ry;
					-- est ce qu'on met les autres set à 0 ?
					-- On met Rx dans A
					done <= '0';
					as<='1';					
					BusSel<='0'&RX;							
					Add_sub <= '1';							
					etat_futur<=etat2;
				end if;
				end if;
				end if;
				end if;
				
			WHEN etat2=>
			    -- On active G, et on met Ry dans le mux
			    gs<='1';
				r0s<='0'; r1s<='0'; r2s<='0'; r3s<='0';
				r4s<='0'; r5s<='0'; r6s<='0'; r7s<='0';
				as<='0'; irs<='0';					
				BusSel <= '0'&RY;						
				etat_futur <= etat3;

			WHEN etat3=>
			    -- On active Rx, et on met La valeur en sortie de G dans le Mux		
				r0s<='0'; r1s<='0'; r2s<='0'; r3s<='0';
				r4s<='0'; r5s<='0'; r6s<='0'; r7s<='0';
				as<='0'; irs<='0';	gs<='0';								
														
				CASE RX IS
				   when "000" => r0s <= '1';
					when "001" => r1s <= '1';
					when "010" => r2s <= '1';
					when "011" => r3s <= '1';
					when "100" => r4s <= '1';
					when "101" => r5s <= '1';
					when "110" => r6s <= '1';
					when "111" => r7s <= '1';
				END CASE;
				BusSel<="1001";
				done<='1';
				etat_futur<=initial;				
			END CASE;
	END PROCESS;
	
	--  Un process séquentiel de mise à jour de l’état présent par l’état futur sur les fronts montant d’horloge
   --  (Reset asynchrone inclus) :
	p_maj_etat:	process(clk, reset_n, run, etat_futur)
	BEGIN
		IF(reset_n = '1')	THEN	--reset asynchrone
			etat_courant <= initial;
		ELSE IF(rising_edge(clk) and run = '1') THEN -- Front montant de l'horloge
				etat_courant <= etat_futur;
			END IF;
		END IF;
	END PROCESS;
	
	
END ARCHITECTURE;