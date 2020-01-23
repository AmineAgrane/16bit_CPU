Library IEEE;
use ieee.std_logic_1164.all;

entity FA_Nbit_Projet_test is
end entity;

-- Test bench du full adder 1 bit
architecture archi_FA_Nbit_Projet_test of FA_Nbit_Projet_test is
	COMPONENT FA_Nbit_Projet IS
	GENERIC ( n : integer := 10 );
		PORT ( 
		a,b: IN STD_LOGIC_VECTOR(n-1 downto 0);
		cin: IN STD_LOGIC;
		cout: OUT STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
	END COMPONENT;
	
	SIGNAL a_s, b_s, s_s: STD_LOGIC_vector(9 downto 0);
	SIGNAL cin_s, cout_s : std_logic;
	begin
		fa_Nbit : FA_Nbit_Projet
			generic map ( 10 )
			port map (
				a => a_s,
				b => b_s,
				s => s_s,
				cout => cout_s,
				cin => cin_s );		
		process
			begin
			   cin_s <= '0';
				a_s <= "0000000001";
				b_s <= "0000000010";
				wait for 20 ns;
				
				cin_s <= '1';
				a_s <= "0000000111";
         	b_s <= "0000001000";
				wait for 20 ns;
				
				cin_s <= '0';
				a_s <= "0000001000";
         	b_s <= "0000000100";
				wait for 20 ns;
				
				cin_s <= '1';
				a_s <= "0000000100";
         	b_s <= "0000000011";
				wait for 20 ns;
				
				cin_s <= '0';
				a_s <= "0000000100";
         	b_s <= "0000010000";
				wait for 20 ns;
				
				cin_s <= '1';
				a_s <= "0000001111";
         	b_s <= "0000001000";
				wait for 20 ns;
				
				cin_s <= '0';
				a_s <= "1000001111";
         	b_s <= "1110001000";
				wait for 20 ns;
				
				
				cin_s <= '1';
				a_s <= "0110000111";
         	b_s <= "0001101000";
				wait for 20 ns;
		end process;
	
			
end architecture;