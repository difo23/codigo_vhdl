     LIBRARY ieee;
     USE IEEE.STD_LOGIC_1164.all;
     USE IEEE.NUMERIC_STD.all;
          
     ENTITY aluComponente IS
     END aluComponente;
 
     ARCHITECTURE entradas_aluComponente OF aluComponente IS
     
       COMPONENT aru
       PORT(op1 : IN std_logic_vector(7 DOWNTO 0);
          op2 : IN std_logic_vector(7 DOWNTO 0);
          proceso : IN std_logic_vector(3 DOWNTO 0);
          res : OUT std_logic_vector(7 DOWNTO 0));
          END COMPONENT;
          
          
          COMPONENT lou
       PORT(op1 : IN std_logic_vector(7 DOWNTO 0);
          op2 : IN std_logic_vector(7 DOWNTO 0);
          proceso : IN std_logic_vector(3 DOWNTO 0);
          res : OUT std_logic_vector(7 DOWNTO 0));
          END COMPONENT;
          
          
       COMPONENT muxVector
     PORT(desdeARU : IN std_logic_vector(7 DOWNTO 0);
          desdeLOU : IN std_logic_vector(7 DOWNTO 0);
          switch : IN std_logic;
          salida : out std_logic_vector(7 DOWNTO 0));
          END COMPONENT;
          
          
       SIGNAL salidaARU		: std_logic_vector(7 DOWNTO 0);
       SIGNAL salidaLOU		: std_logic_vector(7 DOWNTO 0);       
       signal Switch	: std_logic;
       signal proceso : std_logic_vector(3 DOWNTO 0);
       signal salida : std_logic_vector(7 DOWNTO 0);
       SIGNAL A : std_logic_vector(7 DOWNTO 0);
       SIGNAL B : std_logic_vector(7 DOWNTO 0);
       
     BEGIN	
	u0: aru PORT MAP (A,B,proceso,salidaARU);
	u1: lou PORT MAP (A,B,proceso,salidaLOU);
	u2: muxVector PORT MAP (salidaARU,salidaLOU,switch,salida);
	
	A	<= "00000011" after 0 ns,"00000111" after 5 ns, "00000111" after 10 ns, "00001001" after 15 ns, "00000000" after 20 ns, "00000101" after 25 ns, "00001111" after 30 ns, "00000101" after 35 ns;
	B	<= "00000010" after 0 ns,"00000100" after 5 ns, "00000010" after 10 ns, "00000011" after 15 ns, "00000100" after 20 ns, "00000110" after 25 ns, "00001111" after 30 ns, "00000011" after 35 ns;	
	switch <= '1' after 0 ns,'0' after 5 ns,'1' after 10 ns, '0' after 15 ns,'1' after 20 ns,'0' after 25 ns,'1' after 30 ns,'0' after 35 ns,'1' after 40 ns;
	proceso <= "0000" after 0 ns,"0001" after 5 ns, "0010" after 10 ns, "0011" after 15 ns, "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns;
     END entradas_aluComponente;
