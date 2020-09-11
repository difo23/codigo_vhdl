LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;


ENTITY alu IS
  PORT (
      A_IN: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      B_IN: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      salida_OUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0); 
      z_OUT: OUT STD_LOGIC;
      ual_IN: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END alu;

ARCHITECTURE entradas_alu OF alu IS

       COMPONENT sum_16
       PORT(
            
            a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            b: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            S: OUT STD_LOGIC_VECTOR(15 DOWNTO 0); 
            Cout: OUT STD_LOGIC;
            Overflow: OUT STD_LOGIC;
            Cin: IN STD_LOGIC);
          END COMPONENT;

      COMPONENT xor_16
       PORT(
          b: IN std_logic_vector(15 DOWNTO 0);
          a: IN std_logic_vector(15 DOWNTO 0);
          salida : OUT std_logic_vector(15 DOWNTO 0));
          END COMPONENT;

       COMPONENT mux_16
     PORT(
          add: IN std_logic_vector(15 DOWNTO 0);
          comp: IN std_logic_vector(15 DOWNTO 0);
          mov: IN std_logic_vector(15 DOWNTO 0);
          dont_set: IN std_logic_vector(15 DOWNTO 0);
          switch : in std_logic_vector(1 downto 0);
          salida : out std_logic_vector(15 DOWNTO 0);
           z: out std_logic);
    END COMPONENT;

          SIGNAL salida_xor_16: std_logic_vector(15 DOWNTO 0);
          SIGNAL salida_sum_16: std_logic_vector(15 DOWNTO 0);
          SIGNAL salida_mov: std_logic_vector(15 DOWNTO 0);
          SIGNAL salida_dont_set: std_logic_vector(15 DOWNTO 0);       
          signal ual: std_logic_vector(1 downto 0);
          signal z: std_logic;
          signal salida: std_logic_vector(15 DOWNTO 0);
          signal cin: STD_LOGIC;
          signal cout:  STD_LOGIC;
          signal overflow:  STD_LOGIC;
          SIGNAL A: std_logic_vector(15 DOWNTO 0);
          SIGNAL B: std_logic_vector(15 DOWNTO 0);

     BEGIN
      
        A <= A_IN;
        B <= B_IN;
        ual<= ual_IN;
        
        salida_mov <= B;
        salida_dont_set <="0000000011111111";
        u0: sum_16 PORT MAP (A, B, salida_sum_16, cout,overflow,cin);
        u1: xor_16 PORT MAP (A,B,salida_xor_16);
        u2: mux_16 PORT MAP (salida_sum_16, salida_xor_16,salida_mov,salida_dont_set ,ual,salida,z);
        
        salida_OUT <= salida; 
        z_OUT <= z;

        A_IN <= "0000001100001111" after 0 ns,"0000011100001111" after 5 ns, "0000011100001111" after 10 ns, "0000100100001111" after 15 ns, "0000000011110000" after 20 ns, "0000010100001111" after 25 ns, "0000111100001111" after 30 ns, "0000010100001111" after 35 ns;
        B_IN	<= "0000001011110000" after 0 ns,"0000010011110000" after 5 ns, "0000001011110000" after 10 ns, "0000001100001111" after 15 ns, "0000010011110000" after 20 ns, "0000011011110000" after 25 ns, "0000111100001111" after 30 ns, "0000001100001111" after 35 ns;	
        ual_IN <= "01" after 0 ns,"00" after 5 ns,"11" after 10 ns, "10" after 15 ns,"01" after 20 ns,"00" after 25 ns,"01" after 30 ns,"10" after 35 ns,"11" after 40 ns;
        cin <= '1' after 0 ns,'0' after 5 ns,'1' after 10 ns, '0' after 15 ns,'1' after 20 ns,'0' after 25 ns,'1' after 30 ns,'0' after 35 ns,'1' after 40 ns;	

END entradas_alu;