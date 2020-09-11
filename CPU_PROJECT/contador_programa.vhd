--CONTADOR DE PROGRAMA
library IEEE;
use ieee.std_logic_1164.all;
use  work.all;

USE IEEE.NUMERIC_STD.all;

ENTITY contador_programa IS
		port(
			pcin:in std_logic_vector (6 downto 0);
			incp:in std_logic; 
			pcout:inout std_logic_vector (6 downto 0)
		);
END contador_programa;

ARCHITECTURE flujo OF contador_programa IS
BEGIN
pcout <= pcin + "0000001" when incp ='1' else 
	 pcin when incp='0' else
	"0000000" ;
	
END flujo;
