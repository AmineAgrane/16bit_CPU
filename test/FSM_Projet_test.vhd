Library IEEE;
use ieee.std_logic_1164.all;

entity FSM_Projet_test is
end entity;

ARCHITECTURE arch of FSM_Projet_test IS

-- Déclaration de l'entité de la FSM
	COMPONENT FSM IS
	PORT ( 
		IR : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		BusSel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		Add_sub : OUT STD_LOGIC;
		irs, r0s, r1s, r2s, r3s, r4s, r5s, r6s, r7s, as, gs: out std_logic; 
		clk, reset_n,	run:	in std_logic;
		done	:	OUT STD_LOGIC);
	END COMPONENT;
	
	
	SIGNAL irs_s, r0s_s, r1s_s, r2s_s, r3s_s, r4s_s, r5s_s, r6s_s, r7s_s, as_s, gs_s: std_logic; 
	SIGNAL clk_s, reset_n_s,	run_s, done_s, Add_sub_s: std_logic;
	SIGNAL IR_s : STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL BusSel_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	begin
		fsm_test:FSM
			port map (
				IR => IR_s,
				BusSel => BusSel_s,
				Add_sub => Add_sub_s,
				clk => clk_s,
				reset_n => reset_n_s,
				run => run_s,
				done => done_s,
				irs => irs_s,
				r0s => r0s_s,
				r1s => r1s_s,
				r2s => r2s_s,
				r3s => r3s_s,
				r4s => r4s_s,
				r5s => r5s_s,
				r6s => r6s_s,
				as => as_s,
				gs => gs_s,
				r7s => r7s_s);	
				
				process
			begin
			   IR_s <= "001001010";
				clk_s<='1';
				reset_n_s<='0';
				run_s<='1';
				wait for 20 ns;
				
				IR_s <= "000001010";
				clk_s<='1';
				reset_n_s<='0';
				run_s<='1';
				wait for 20 ns;
				
				IR_s <= "000011010";
				clk_s<='1';
				reset_n_s<='0';
				run_s<='1';
				wait for 20 ns;
				
				IR_s <= "001100010";
				clk_s<='1';
				reset_n_s<='0';
				run_s<='1';
				wait for 20 ns;
				wait;
		end process;
	
END ARCHITECTURE;