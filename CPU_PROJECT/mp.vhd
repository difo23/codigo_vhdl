library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MP is


	PORT (
	
		DIR: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		I: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		LE : IN STD_LOGIC;
		O: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	
end MP;


architecture Behavioral of MP is

	signal s: std_logic_vector(15 downto 0);
	signal o_signal: std_logic_vector(15 downto 0);

begin

		with dir select
			O_SIGNAL <=    "0000111" when "0000001",
								"0001111" when "0000010",
								"0011111" when "0000011",
								"0111111" when "0000100",
								"0000000" when others;
			O <= O_SIGNAL;


end Behavioral;

