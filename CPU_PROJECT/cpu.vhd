LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;


ENTITY cpu IS
		port(
				RESET_in: IN STD_LOGIC;
				CO1_in: IN STD_LOGIC;
				CO0_in : IN STD_LOGIC;
				FZ_in : IN STD_LOGIC;
				CLK_in : IN STD_LOGIC 
		);
END cpu;


ARCHITECTURE entradas_cpu OF cpu IS

       COMPONENT  up_mp IS
			  PORT (
					L_E_IN: INOUT STD_LOGIC;
					EA_IN: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
					EB_IN: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
					UAL_IN: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
					ICNP_IN: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
					EZ_IN: INOUT STD_LOGIC;
					ERI_IN: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
					MX_IN: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
					FZ_OUT: OUT STD_LOGIC;
					CO_OUT: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
					);
       END COMPONENT;
       
       
      COMPONENT control_unit IS
				PORT(
					RESET: IN STD_LOGIC;
					CO1: IN STD_LOGIC;
					CO0 : IN STD_LOGIC;
					FZ : IN STD_LOGIC;
					CLK : IN STD_LOGIC; 
					LE: OUT STD_LOGIC;
					INCP: OUT STD_LOGIC;
					ERI: OUT STD_LOGIC;
					MX1: OUT STD_LOGIC;
					MX0: OUT STD_LOGIC;
					EA: OUT STD_LOGIC;
					EB: OUT STD_LOGIC;
					UAL1: OUT STD_LOGIC;
					UAL0: OUT STD_LOGIC; 
					EZ	: OUT STD_LOGIC
					);
	END COMPONENT;
	
      
					signal L_E_IN_signal:  STD_LOGIC;
					signal EA_IN_signal:   STD_LOGIC_VECTOR(15 DOWNTO 0);
					signal EB_IN_signal:   STD_LOGIC_VECTOR(15 DOWNTO 0);
					signal UAL_IN_signal:  STD_LOGIC_VECTOR(1 DOWNTO 0);
					signal ICNP_IN_signal: STD_LOGIC_VECTOR(1 DOWNTO 0);
					signal EZ_IN_signal:   STD_LOGIC;
					signal ERI_IN_signal:  STD_LOGIC_VECTOR(7 DOWNTO 0);
					signal MX_IN_signal:   STD_LOGIC_VECTOR(1 DOWNTO 0);
					signal FZ_OUT_signal:  STD_LOGIC;
					signal CO_OUT_signal:  STD_LOGIC_VECTOR(1 DOWNTO 0);
					signal RESET_signal:  STD_LOGIC;
					signal CO1_signal:  STD_LOGIC;
					signal CO0_signal :  STD_LOGIC;
					signal FZ_signal :  STD_LOGIC;
					signal CLK_signal :  STD_LOGIC; 
					signal MX1_signal:  STD_LOGIC;
					signal MX0_signal:  STD_LOGIC;
					signal UAL1_signal: STD_LOGIC;
					signal UAL0_signal: STD_LOGIC; 
     BEGIN
     
    --map
    
					
	RESET_signal<= RESET_IN;	
	CO1_signal<= CO1_in;
	CO0_signal<= CO0_in ;
	FZ_signal <= FZ_in;
	CLK_signal<=CLK_in; 
	CO_signal(0)<=CO0_signal;
	CO_signal(1)<=CO1_signal;
	MX_IN_signal(0)<=MX0_signal;
	MX_IN_signal(1)<=MX1_signal;
	UAL_IN_signal(0)<=UAL0_signal;
	UAL_IN_signal(1)<=UAL1_signal;
	
	u1: control_unit PORT MAP (RESET_signal, CO1_signal,CO0_signal,FZ_signal,CLK_signal,L_E_IN_signal, ICNP_IN_signal,ERI_IN_signal,MX0_signal,MX1_signal,EB_IN_signal, EB_IN_signal, UAL0_signal,UAL1_signal, EZ_IN_signal);
	
	u0: up_mp PORT MAP (L_E_IN_signal,EA_IN_signal, EB_IN_signal, UAL_IN_signal, ICNP_IN_signal, EZ_IN_signal, ERI_IN_signal,MX_IN_signal,FZ_OUT_signal,CO_OUT_signal);
	
      
     

END entradas_cpu;
