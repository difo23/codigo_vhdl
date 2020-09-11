     LIBRARY ieee;
     USE IEEE.STD_LOGIC_1164.all;
     USE IEEE.NUMERIC_STD.all;
     
          ENTITY aru IS
     PORT(op1 : IN std_logic_vector(7 DOWNTO 0);
          op2 : IN std_logic_vector(7 DOWNTO 0);
          proceso : IN std_logic_vector(3 DOWNTO 0);
          res : OUT std_logic_vector(7 DOWNTO 0));
     END aru;
 
     ARCHITECTURE synth OF aru IS
     SIGNAL a,b:UNSIGNED(op1'range);
     SIGNAL c:UNSIGNED(res'range);
     BEGIN 
       PROCESS (a, b, proceso)
       BEGIN 
         CASE proceso IS
           WHEN "0000" => c <= RESIZE((a + b),c'length);
           WHEN "0001" => c <= RESIZE((a - b),c'length);
           WHEN "0010" => c <= RESIZE((a * b),c'length);
           
           WHEN "0011" => c <= RESIZE((a / b),c'length);
           WHEN "0100" => c <= RESIZE((a + "1"),c'length);
           WHEN "0101" => c <= RESIZE((b + "1"),c'length);
           WHEN OTHERS => null;
         END CASE;
       END PROCESS;
 
       a <= UNSIGNED(op1);
       b <= UNSIGNED(op2);
       res <= std_logic_vector(c);
 
     END synth;
