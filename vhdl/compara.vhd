     LIBRARY ieee;
     USE IEEE.STD_LOGIC_1164.all;
     USE IEEE.NUMERIC_STD.all;
 
ENTITY compara IS
port(A : IN std_logic_vector(3 DOWNTO 0);
B : IN std_logic_vector(3 DOWNTO 0);
AB0, AB1, AB2, AB3,AB,BA,S3,S1,S2,S0_igual : INOUT std_logic);
END compara;


     ARCHITECTURE circ OF compara IS
     BEGIN


S3 <= not(A(3) xor B(3));
S2 <= (not(A(2) xor B(2))) and S3;
S1 <= (not(A(1) xor B(1))) and S2;
S0_igual <= (not(A(0) xor B(0))) and S1;

AB3 <= (not(B(3))) and A(3);
AB2 <= S3 and (not(B(2))) and A(2);
AB1 <= S2 and (not(B(1))) and A(1);
AB0 <= S1 and (not(B(0))) and A(0);

AB <= (AB0 or AB1 or AB2 or AB3);
BA <= (not (AB)) and (NOT (S0_igual));

END circ;
