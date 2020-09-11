LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY control_unit IS
PORT(
	RESET, CO1, CO0, FZ, CLK : IN STD_LOGIC; 
	LE, INCP, ERI, MX1, MX0, EA, EB, UAL1, UAL0, EZ	: OUT STD_LOGIC
);
END control_unit;

ARCHITECTURE machinery OF control_unit IS
TYPE STATE_TYPE IS (s0, s1, s2, s3, s4, s5, s6);
SIGNAL state : STATE_TYPE;
BEGIN
	PROCESS(CLK, RESET)
	BEGIN
		IF (CLK'EVENT AND CLK = '1') THEN
		
			IF RESET = '0' THEN
			
				CASE state IS
				
					WHEN s0=>						
						state<=s1;

					WHEN s1=>
						IF CO1 <= '0' THEN
							state <= s2;
			     			ELSIF CO1 <= '1' AND CO0 <= '0' THEN
					     		state <= s5;
						ELSIF CO1 <= '1' AND CO0 <= '1' AND FZ <= '0' THEN
							state <= s0;
						ELSIF CO1 <= '1' AND CO0 <= '1' AND FZ <= '1' THEN
							state <= s6;
						END IF;
	
					WHEN s2=>
						IF CO0 <= '0' THEN
							state <= s3;
			     			ELSIF CO0 <= '1' THEN
					     		state <= s4;
						END IF;
	
					WHEN s3=>
						state <= S0;
	
					WHEN s4=>
						state <= S0;
	
					WHEN s5=>
						state <= s0;
	
					WHEN s6=>
						state <= s1;

					WHEN OTHERS=>
						state <= s0;

				END CASE;
			ELSE state <= s0;
			END IF;
		END IF;
	END PROCESS;

	PROCESS(state)
	BEGIN

		CASE state IS
				WHEN s0=>						
					LE <= '0';
					INCP <= '1';
					ERI <= '1';
					MX1 <= '0';
					MX0 <= '0';
					EA <= '0';
					EB <= '0';
					UAL1 <= '0';
					UAL0 <= '0';
					EZ <= '0';

				WHEN s1=>
					LE <= '0';
					INCP <= '0';
					ERI <= '0';
					MX1 <= '1';
					MX0 <= '0';
					EA <= '0';
					EB <= '1';
					UAL1 <= '0';
					UAL0 <= '0';
					EZ <= '0';

				WHEN s2=>
					LE <= '0';
					INCP <= '0';
					ERI <= '0';
					MX1 <= '1';
					MX0 <= '1';
					EA <= '1';
					EB <= '0';
					UAL1 <= '0';
					UAL0 <= '0';
					EZ <= '0';

				WHEN s3=>
					LE <= '1';
					INCP <= '0';
					ERI <= '0';
					MX1 <= '1';
					MX0 <= '1';
					EA <= '0';
					EB <= '0';
					UAL1 <= '0';
					UAL0 <= '0';
					EZ <= '1';

				WHEN s4=>
					LE <= '0';
					INCP <= '0';
					ERI <= '0';
					MX1 <= '0';
					MX0 <= '0';
					EA <= '0';
					EB <= '0';
					UAL1 <= '0';
					UAL0 <= '1';
					EZ <= '1';

				WHEN s5=>
					LE <= '1';
					INCP <= '0';
					ERI <= '0';
					MX1 <= '1';
					MX0 <= '1';
					EA <= '0';
					EB <= '0';
					UAL1 <= '1';
					UAL0 <= '0';
					EZ <= '1';

				WHEN s6=>
					LE <= '0';
					INCP <= '1';
					ERI <= '1';
					MX1 <= '1';
					MX0 <= '1';
					EA <= '0';
					EB <= '0';
					UAL1 <= '0';
					UAL0 <= '0';
					EZ <= '0';

				WHEN OTHERS=>
					LE <= '0';
					INCP <= '0';
					ERI <= '0';
					MX1 <= '0';
					MX0 <= '0';
					EA <= '0';
					EB <= '0';
					UAL1 <= '0';
					UAL0 <= '0';
					EZ <= '0';
			END CASE;
	END PROCESS;
END machinery;