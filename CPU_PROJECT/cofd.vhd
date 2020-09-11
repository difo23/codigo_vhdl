library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COFD is

	PORT (
		O: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		ERI: IN STD_LOGIC;
		CO: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		F: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

		
end COFD;

architecture Behavioral of COFD is

 --signal CO0_signal: std_logic_vector(1 downto 0);
 --signal CO1_signal: std_logic_vector(1 downto 0);
 signal TOT_F_SIGNAL : std_logic_vector(15 downto 0);

-- PARTIMOS EN BITS SIGNIFICATIVOS EL TOTAL	
ALIAS CO_signal IS TOT_F_SIGNAL(15 downto 14);
ALIAS F_signal IS TOT_F_SIGNAL(13 downto 7);
ALIAS D_signal IS TOT_F_SIGNAL(6 downto 0);

begin
	
CO <= CO_SIGNAL;
F <= F_SIGNAL;
D <= D_SIGNAL;

end Behavioral;

