Library IEEE;
use ieee.std_logic_1164.all;

entity Reg1bit_Projet_test is
end entity;


-- Test bench du registre 1 bit
-- A tester sur le simulateur du pc
architecture archi_Reg1bit_Projet_test of Reg1bit_Projet_test is
	COMPONENT Reg1bit_Projet IS
		PORT ( 
	   CLK, D, Set, Reset : IN STD_LOGIC;
      Q : OUT STD_LOGIC
	        ); 
	END COMPONENT;
	
	SIGNAL d_s, q_s, rst_s, clk_s, set_s : std_logic;
	
	begin
		reg_1bit : Reg1bit_Projet
			port map (
				Reset => rst_s,
				CLK => clk_s,
				Set => set_s,
				D => d_s,
				Q => q_s
			);
			
		process
			begin
				rst_s <= '1';
				clk_s <= '0';
				wait for 20 ns;
				
				set_s <= '0';
				
				d_s <= '0';
				clk_s <= '1';
				wait for 20 ns;
				
				d_s <= '1';
				clk_s <= '0';
				wait for 20 ns;
				clk_s <= '1';
				wait for 20 ns;
				
				d_s <= '0';
				set_s <= '1';
				clk_s <= '0';
				wait for 20 ns;
				clk_s <= '1';
				wait for 20 ns;
				
				d_s <= '1';
				set_s <= '1';
				clk_s <= '0';
				wait for 20 ns;
				clk_s <= '1';
				wait for 20 ns;
				
				
		end process;
	
			
end architecture;