LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sum_16 IS

PORT (
		 
		 a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); 
		 Cout: OUT STD_LOGIC;
		 Overflow : OUT STD_LOGIC;
		Cin : IN STD_LOGIC );
END sum_16;

ARCHITECTURE Behavior OF sum_16 IS
		SIGNAL C : STD_LOGIC_VECTOR(16 downto 0) ;
	BEGIN
		S(0) <= A(0) xor B(0) xor Cin;
		C(0) <= (A(0) and B(0)) or (Cin and(A(0)xor B(0)));

		S(1) <= (A(1) xor B(1)) xor C(0);
		C(1) <= (A(1) and B(1) ) or (C(0)and(A(1)xor B(1)));

		S (2) <= (A (2) xor B (2) ) xor C(1);
		C (2) <= (A (2) and B(2)) or (C (1) and (A(2) xor B(2)));

		S (3) <= (A (3) xor B (3) ) xor C(2);
		C (3) <= (A (3) and B(3)) or (C (2) and (A(3) xor B(3)));

		S (4) <= (A (4) xor B (4) ) xor C(3);
		C (4) <= (A (4) and B(4)) or (C (3) and (A(4) xor B(4)));

		S (5) <= (A (5) xor B (5) ) xor C(4);
		C (5) <= (A (5) and B(5)) or (C (4) and (A(5) xor B(5)));

		S (6) <= (A (6) xor B(6) ) xor C(5);
		C (6) <= (A (6) and B(6)) or (C (5) and (A(6) xor B(6)));

		S (7) <= (A (7) xor B (7) ) xor C(6);
		C (7) <= (A (7) and B(7)) or (C (6) and (A(7) xor B(7)));

		S (8) <= (A (8) xor B (8) ) xor C(7);
		C (8) <= (A (8) and B(8)) or (C (7) and (A(8) xor B(8)));

		S (9) <= (A (9) xor B (9) ) xor C(8);
		C (9) <= (A (9) and B(9)) or (C (8) and (A(9) xor B(9)));

		S (10) <= (A (10) xor B (10) ) xor C(9);
		C (10) <= (A (10) and B(10)) or (C (9) and (A(10) xor B(10)));

		S (11) <= (A (11) xor B (11) ) xor C(10);
		C (11) <= (A (11) and B(11)) or (C (10) and (A(11) xor B(11)));

		S (12) <= (A (12) xor B (12) ) xor C(11);
		C (12) <= (A (12) and B(12)) or (C (11) and (A(12) xor B(12)));

		S (13) <= (A (13) xor B (13) ) xor C(12);
		C (13) <= (A (13) and B(13)) or (C (12) and (A(13) xor B(13)));

		S (14) <= (A (14) xor B (14) ) xor C(13);
		C (14) <= (A (14) and B(14)) or (C (13) and (A(14) xor B(14)));

		S (15) <= (A (15) xor B (15) ) xor C(14);
		Cout <= (A(15) and B(15)) or (C(14) and (A(15)xor B(15)));

END Behavior;