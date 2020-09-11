LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY xor_16 IS
     PORT(
          a: IN std_logic_vector(15 DOWNTO 0);
          b: IN std_logic_vector(15 DOWNTO 0);
          salida : OUT std_logic_vector(15 DOWNTO 0));
END xor_16;

ARCHITECTURE xor_comp OF xor_16 IS

     SIGNAL a1,b1:UNSIGNED(a'range);
     SIGNAL c:UNSIGNED(salida'range);

     BEGIN
        a1 <= UNSIGNED(a);
        b1 <= UNSIGNED(b);
        c <= RESIZE((a1 xor b1),c'length);
        salida <= std_logic_vector(c);
        
 END xor_comp;
