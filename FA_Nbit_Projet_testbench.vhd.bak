Library IEEE;
use ieee.std_logic_1164.all;

entity FA_1bit_Projet_test is
end entity;

-- Test bench du full adder 1 bit
architecture archi_Fa_1bit_Projet_test of Fa_1bit_Projet_test is
	COMPONENT FA_1bit_Projet IS
		PORT ( 
		a, b, cin : in std_logic;
		cout, s: out std_logic 
	        );
	END COMPONENT;
	
	SIGNAL a_s, b_s, cout_s, cin_s, s_s : std_logic;
	
	begin
		fa_1bit : FA_1bit_Projet
			port map (
				a => a_s,
				b => b_s,
				s => s_s,
				cout => cout_s,
				cin => cin_s );
			
		process
			begin
			   cin_s <= '0';
				a_s <= '0';
				b_s <= '0';
				wait for 20 ns;
				
				cin_s <= '1';
				a_s <= '0';
				b_s <= '0';
				wait for 20 ns;
				
				cin_s <= '0';
				a_s <= '1';
				b_s <= '0';
				wait for 20 ns;
				
				cin_s <= '1';
				a_s <= '1';
				b_s <= '0';
				wait for 20 ns;
				
				cin_s <= '0';
				a_s <= '0';
				b_s <= '1';
				wait for 20 ns;
				
				cin_s <= '1';
				a_s <= '0';
				b_s <= '1';
				wait for 20 ns;
				
				cin_s <= '0';
				a_s <= '1';
				b_s <= '1';
				wait for 20 ns;
				
				
				cin_s <= '1';
				a_s <= '1';
				b_s <= '1';
				wait for 20 ns;
		end process;
	
			
end architecture;