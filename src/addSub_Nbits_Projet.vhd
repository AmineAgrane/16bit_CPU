Library IEEE;
use ieee.std_logic_1164.all;

--Effectuer D = X − Y est équivalent à D = X + Y + 1 en complément à 2.
--Soit choice un signal de contrôle valant 0 si on veut faire une addition, et 1 si on veut faire une soustraction.
entity addSub_Nbits_Projet is
	generic ( n : integer := 2 );
	port ( 
		a, b : in std_logic_vector(n-1 downto 0);
		choice : in std_logic;
		s : out std_logic_vector(n-1 downto 0);
		cout : out std_logic
	);
end entity;

ARCHITECTURE archi_addSub_Nbits OF addSub_Nbits_Projet IS
	COMPONENT FA_Nbit_Projet IS
		GENERIC ( n : integer := 4 );
	    PORT ( 
		a,b: IN STD_LOGIC_VECTOR(n-1 downto 0);
		cin: IN STD_LOGIC;
		cout: OUT STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	         );
	END COMPONENT;
	
	COMPONENT Mux2v1_Nbit_Projet IS
		GENERIC ( N : integer := 8 );
	    PORT ( 
		X, Y : in STD_LOGIC_vector(N-1 downto 0);
		S : in std_logic;
		M : out STD_LOGIC_vector(N-1 downto 0) 
	         );
	END COMPONENT;
	
	COMPONENT  Mux2v1_1bit_Projet IS
		PORT ( 
		X,Y,S: IN STD_LOGIC;
		M : OUT STD_LOGIC 
	         );
	END COMPONENT;
	
	
	signal b_s, y_s : std_logic_vector(n-1 downto 0);
	signal cin_s : std_logic;
	
	begin
		y_s <= not b;
	
		mux1 : Mux2v1_Nbit_Projet
			generic map( n => n )
			port map(
				X=> b,
				Y => y_s, -- tester avec un signal qui prend le not
				S => choice,
				M => b_s
			);
			
		mux2 : Mux2v1_1bit_Projet
			port map(
				X => '0',
				Y => '1',
				S => choice,
				M => cin_s
			);
		
		add : FA_Nbit_Projet
			generic map ( n => n )
			port map (
				a => a, 
				b => b_s,
				cin => cin_s,
				s => s,
				cout => cout
			);
	
end architecture;