Library IEEE;
use ieee.std_logic_1164.all;

entity ALU_testbench is
end entity;

-- Test bench du full adder 1 bit
architecture archi_ALU_testbench of ALU_testbench is
	COMPONENT ALU IS
	GENERIC ( n : integer := 10 );
	PORT ( 	
		A: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		B: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		instruction: IN STD_LOGIC;
		resultat: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		overflow: OUT STD_LOGIC );
	END COMPONENT;
	
	SIGNAL a_s, b_s, resultat_s: STD_LOGIC_vector(9 downto 0);
	SIGNAL instruction_s, cout_s : std_logic;
	begin
		alu1 : ALU
			generic map ( 10 )
			port map (
				A => a_s,
				B => b_s,
				resultat => resultat_s,
				overflow => cout_s,
				instruction => instruction_s );		
		process
			begin
			   instruction_s <= '0';
				a_s <= "0000000001";
				b_s <= "0000000010";
				wait for 20 ns;
				
				instruction_s <= '1';
				a_s <= "0000000111";
         	b_s <= "0000001000";
				wait for 20 ns;
				
				instruction_s <= '0';
				a_s <= "0000001000";
         	b_s <= "0000000100";
				wait for 20 ns;
				
				instruction_s <= '1';
				a_s <= "0000000100";
         	b_s <= "0000000011";
				wait for 20 ns;
				
				instruction_s <= '0';
				a_s <= "0001111111";
				b_s <= "0000000010";
				wait for 20 ns;
				
				instruction_s <= '1';
				a_s <= "0000011111";
         	b_s <= "0000001000";
				wait for 20 ns;
				
				instruction_s <= '0';
				a_s <= "0100001000";
         	b_s <= "1100000100";
				wait for 20 ns;
				
				instruction_s <= '1';
				a_s <= "0001110010";
         	b_s <= "0100000011";
				wait for 20 ns;
				wait;
		end process;
	
			
end architecture;