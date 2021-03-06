library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_7 is

	PORT (
			CP: in std_logic_vector(6 downto 0);
			CO: in std_logic_vector(1 downto 0);
			F : in std_logic_vector(6 downto 0);
			D : in std_logic_vector(6 downto 0);
			switch: in std_logic_vector(1 downto 0);
			salida_Z: out std_logic_vector(6 downto 0));
			
end MUX_7;

architecture Behavioral of MUX_7 is

	signal CP_SIGNAL: std_logic_vector(6 downto 0);
	signal F_SIGNAL: std_logic_vector(6 downto 0);
	signal D_SIGNAL: std_logic_vector(6 downto 0);
   SIGNAL salida_Z_signal: std_logic_vector(6 downto 0);


begin

		with switch select
			salida_z_signal <= CP when "00",
					D when "11",
					F when "10",
					CO when others; --OJOOOO
		salida_z <= salida_z_signal;
	


end Behavioral;

