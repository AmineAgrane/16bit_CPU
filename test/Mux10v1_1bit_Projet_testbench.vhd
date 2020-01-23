Library IEEE;
use ieee.std_logic_1164.all;

entity Mux10v1_1bit_Projet_testbench is
end entity;

architecture archi_Mux10v1_1bit_Projet_testbench of Mux10v1_1bit_Projet_testbench is
	component Mux10v1_1bit_Projet IS
	PORT (
	DIN,G,R0,R1,R2,R3,R4,R5,R6,R7 : IN STD_LOGIC;	
	Bus_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Bus_Data : OUT STD_LOGIC
	 );
	end component;
	
	signal din_s, g_s, r0_s, r1_s, r2_s, r3_s, r4_s, r5_s, r6_s, r7_s : STD_LOGIC;
	signal sel_s : std_logic_vector(3 downto 0);
	signal s_s : STD_LOGIC;
	
	begin
		mux10v1_1bit : Mux10v1_1bit_Projet
			port map (
				DIN => din_s,
				G => g_s,
				R0 => r0_s,
				R1 => r1_s,
				R2 => r2_s,
				R3 => r3_s,
				R4 => r4_s,
				R5 => r5_s,
				R6 => r6_s,
				R7 => r7_s,
				Bus_Select=> sel_s,
				Bus_Data => s_s
			);
			
		process
			begin
				din_s <= '0';
				g_s <= '1';
				r0_s <= '0';
				r1_s <= '1';
				r2_s <= '0';
				r3_s <= '1';
				r4_s <= '0';
				r5_s <= '1';
				r6_s <= '0';
				r7_s <= '1';
				
				sel_s <= "0000";
				
				wait for 20 ns;
				sel_s <= "0001";
				
				wait for 20 ns;
				sel_s <= "0010";
				
				wait for 20 ns;
				sel_s <= "0011";
				
				wait for 20 ns;
				sel_s <= "0100";
				
				wait for 20 ns;
				sel_s <= "0101";
				
				wait for 20 ns;
				sel_s <= "0111";
				
				wait for 20 ns;
				sel_s <= "1000";
				
				wait for 20 ns;
				sel_s <= "1001";
				
				wait for 20 ns;
				sel_s <= "1010";
				
				wait;
		end process;
	
			
end architecture;