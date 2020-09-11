-- Diseño del mux que seleccionauna operación
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity mux_16 is 
 port(
		add: in std_logic_vector(15 downto 0);
		comp: in std_logic_vector(15 downto 0);
		mov : in std_logic_vector(15 downto 0);
		dont_set : in std_logic_vector(15 downto 0);
		switch: in std_logic_vector(1 downto 0);
		salida: out std_logic_vector(15 downto 0);
		z: out std_logic);
end mux_16;

architecture arq_mux of mux_16 is

	--signal add,comp, mov, dont_set: std_logic_vector(15 downto 0);
	 signal s: std_logic_vector(15 downto 0);
begin
		with switch select
			s <= add when "00",
					comp when "01",
					mov when "10",
					dont_set when others;
		salida<=s;
		z <= '0' when comp > "0000000000000000" else '1';
		

end arq_mux;
