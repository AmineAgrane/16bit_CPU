Library IEEE;
use ieee.std_logic_1164.all;

entity Mux10v1_Nbit_Projet_testbench is

end entity;

architecture archi_Mux10v1_Nbit_Projet_testbench of Mux10v1_Nbit_Projet_testbench is
	component Mux10v1_Nbit_Projet is
		generic ( N : integer := 10 );
		PORT (
	DIN, G, R0,R1,R2,R3,R4,R5,R6,R7 : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);	
	Bus_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Bus_Data : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
	 );
	end component;
	
	signal din_s, g_s, r0_s, r1_s, r2_s, r3_s, r4_s, r5_s, r6_s, r7_s : STD_LOGIC_vector(9 downto 0);
	signal sel_s : std_logic_vector(3 downto 0);
	signal s_s : STD_LOGIC_vector(9 downto 0);
	
	begin
		mux10v1_Nbit : Mux10v1_Nbit_Projet
			generic map ( 10 )
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
				Bus_Select => sel_s,
				Bus_Data => s_s
			);
			
		process
			begin
						--wait for 40 ns;
			
				
				r0_s <= "0000000000";
				r1_s <= "0000000001";
				r2_s <= "0000000010";
				r3_s <= "0000000011";
				r4_s <= "0000000100";
				r5_s <= "0000000101";
				r6_s <= "0000000110";
				r7_s <= "0000000111";
				din_s <= "0000001000";
				g_s <= "0000001001";
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
				sel_s <= "0110";
				
				wait for 20 ns;
				sel_s <= "0111";
				
				wait for 20 ns;
				sel_s <= "1000";
				
				wait for 20 ns;
				sel_s <= "1001";
				
				wait;
		end process;
	
			
end architecture;