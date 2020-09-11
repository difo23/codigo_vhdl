     LIBRARY ieee;
     USE IEEE.STD_LOGIC_1164.all;
     USE IEEE.NUMERIC_STD.all;
     ENTITY compara_tb IS
     END compara_tb;
 
     ARCHITECTURE entradas_compara OF compara_tb IS
       COMPONENT compara
         port(A : IN std_logic_vector(3 DOWNTO 0);
         B : IN std_logic_vector(3 DOWNTO 0);
         AB0, AB1, AB2, AB3,AB,BA,S3,S1,S2
         ,S0_igual : INOUT std_logic);
       END COMPONENT;
       SIGNAL A		: std_logic_vector(3 DOWNTO 0);
       SIGNAL B		: std_logic_vector(3 DOWNTO 0);
       signal S3	: std_logic;
       signal S1	: std_logic;
       signal S2	: std_logic;
       signal S0_igual : std_logic;
       signal AB0	: std_logic ;
       signal AB1	: std_logic;
       signal AB2	: std_logic;
       signal AB3	: std_logic;
       signal AB	: std_logic;
       signal BA	: std_logic;
       
     BEGIN
	u0: compara PORT MAP (A,B,AB0,AB1,AB2,AB3,AB
							,BA,S3,S1,S2,S0_igual); 	
	A	<= "0011" after 0 ns,"0111" after 5 ns, "0111" after 10 ns, "1001" after 15 ns, "0000" after 20 ns, "0101" after 25 ns, "1111" after 30 ns, "0101" after 35 ns, "1010" after 40 ns, "1001" after 45 ns, "1100" after 50 ns, "1101" after 55 ns, "1100" after 60 ns, "0000" after 65 ns;
	B	<= "0010" after 0 ns,"0100" after 5 ns, "0010" after 10 ns, "0011" after 15 ns, "0100" after 20 ns, "0110" after 25 ns, "1111" after 30 ns, "0011" after 35 ns, "1001" after 40 ns, "1100" after 45 ns, "1010" after 50 ns, "1000" after 55 ns, "1100" after 60 ns, "0000" after 65 ns;	
     END entradas_compara;
