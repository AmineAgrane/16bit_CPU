Library IEEE;
use ieee.std_logic_1164.all;

entity Reg_Nbits_Projet_testbench is
end entity;

architecture archi_Reg_Nbits_Projet_testbench of Reg_Nbits_Projet_testbench is
	component Reg_Nbits_Projet is
		generic ( n : integer := 10 );
		PORT (
	    D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		Q : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		Set, CLK, Reset : IN STD_LOGIC
	); 
    END component;
	
	signal d_s, q_s : STD_LOGIC_vector(9 downto 0);
	signal rst_s, clk_s, set_s : std_logic;
	
	begin
		reg_Nbits_Projet1 : Reg_Nbits_Projet
			generic map ( 10 )
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
				
				d_s <= "0000000000";
				clk_s <= '1';
				wait for 20 ns;
				
				d_s <= "0000000010";
				clk_s <= '0';
				wait for 20 ns;
				clk_s <= '1';
				wait for 20 ns;
				
				d_s <= "0000000011";
				set_s <= '1';
				clk_s <= '0';
				wait for 20 ns;
				clk_s <= '1';
				wait for 20 ns;
				
				d_s <= "0000000100";
				set_s <= '1';
				clk_s <= '0';
				wait for 20 ns;
				clk_s <= '1';
				wait for 20 ns;
				
				wait;
		end process;
	
			
end architecture;