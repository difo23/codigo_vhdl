     LIBRARY ieee;
     USE IEEE.STD_LOGIC_1164.all;
     USE IEEE.NUMERIC_STD.all;
     
	ENTITY muxVector IS
     PORT(desdeARU : IN std_logic_vector(7 DOWNTO 0);
          desdeLOU : IN std_logic_vector(7 DOWNTO 0);
          switch : IN std_logic;
          salida : out std_logic_vector(7 DOWNTO 0));
     END muxVector;
 
     ARCHITECTURE cambio OF muxVector IS
     BEGIN
     with switch select
     salida <= desdeARU when '0' , desdeLOU when others;
     END cambio;
