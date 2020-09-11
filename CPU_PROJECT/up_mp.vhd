LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;
USE IEEE.NUMERIC_STD.all;


ENTITY up_mp IS
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
END up_mp;

ARCHITECTURE entradas_up_mp OF up_mp IS

		COMPONENT alu	
			PORT(      
				A_IN: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				B_IN: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				salida_OUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0); 
				z_OUT: OUT STD_LOGIC;
				ual_IN: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0)
			);
		END COMPONENT;

		COMPONENT contador_programa
			PORT(
				pcin : IN  std_logic_vector(6 downto 0);
				incp : IN  std_logic;
				pcout : INOUT  std_logic_vector(6 downto 0)
			);
		END COMPONENT;

		COMPONENT MP
			PORT (
				DIR: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
				I: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				LE : IN STD_LOGIC;
				O: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
		END COMPONENT;

		COMPONENT COFD
			PORT (
				O: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				ERI: IN STD_LOGIC;
				CO: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
				D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				F: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
		END COMPONENT;


		COMPONENT MUX7
			PORT (
					CP: in std_logic_vector(6 downto 0);
					CO: in std_logic_vector(1 downto 0);
					F : in std_logic_vector(6 downto 0);
					D : in std_logic_vector(6 downto 0);
					SWITCH: in std_logic_vector(1 downto 0);
					salida_Z: out std_logic_vector(6 downto 0)
			);

		END COMPONENT;
		
		COMPONENT flip_flop_d is
				Port ( 
				D  : in  STD_LOGIC;
				EN : in  STD_LOGIC;
				Q  : out STD_LOGIC
				);
		end component;
		
--signal del alu
          SIGNAL A_signal: std_logic_vector(15 DOWNTO 0);
          SIGNAL B_signal: std_logic_vector(15 DOWNTO 0);
          SIGNAL salida_ual_signal: std_logic_vector(15 DOWNTO 0);
          signal ual_switch: std_logic_vector(1 downto 0);
          signal z_signal: std_logic;
 --signal del contador_programa         
          SIGNAL PC_IN_signal: std_logic_vector(6 DOWNTO 0); 
          SIGNAL INCP_signal: STD_LOGIC; 
          SIGNAL PC_out_signal: std_logic_vector(6 DOWNTO 0); 
-- signal del MP
			Signal DIR_signal: STD_LOGIC_VECTOR(6 DOWNTO 0);
			Signal I_signal: STD_LOGIC_VECTOR(15 DOWNTO 0);
			Signal LE_sigal: STD_LOGIC;
			Signal O_mp_signal: STD_LOGIC_VECTOR(15 DOWNTO 0);
--Signal del COFD
			Signal O_signal: STD_LOGIC_VECTOR(15 DOWNTO 0);
			Signal ERI_signal: STD_LOGIC;
			Signal CO_signal:  STD_LOGIC_VECTOR(1 DOWNTO 0);
			Signal D_signal:  STD_LOGIC_VECTOR(6 DOWNTO 0);
			Signal F_signal:  STD_LOGIC_VECTOR(6 DOWNTO 0)
--Signal MUX7
			signal CP_mx_signal: std_logic_vector(6 downto 0);
			signal CO_mx_signal: std_logic_vector(1 downto 0);
			signal F_signal_mux : std_logic_vector(6 downto 0);
			signal D_signal_mux : std_logic_vector(6 downto 0);
			signal SWITCH_signal_mux: std_logic_vector(1 downto 0);
			signal salida_Z_signal: std_logic_vector(6 downto 0)
--signal flip_flop_d
				signal Din_signal  : STD_LOGIC;
				signal EN_signal : STD_LOGIC;
				signal Q_signal  : STD_LOGIC

     BEGIN

--enlaces iniciales

--alu map
	A_signal <= EA_IN;
	B_signal <= EB_IN;
	ual_switch<= ual_IN;
	u0: alu	 PORT MAP (A_signal, B_signal, salida_ual_signal, z_signal,ual_switch);
         
        
--map del COFD
			
	ERI_signal
	O_signal<=O_mp_signal;
	u4: COFD PORT MAP (O_signal, ERI_signal,CO_signal,D_signal ,F_signal);
	
				
--mux 7  map
	SWITCH_signal_MuX<= MX_IN;
	CP_mx_signal<= PC_out_signal; 
	CO_mx_signal<=CO_signal:
	F_signal_mux<=F_signal:
	D_signal_mux <=D_signal:
	u1: MUX7 PORT MAP (CP_mx_signal, CO_mx_signal,F_signal_mux,D_signal_mux ,SWITCH_signal_mux,salida_Z_signal); 
 
			
--map del contador_programa         
	PC_IN_signal<= salida_Z_signal ; 
	INCP_signal<= INCP_IN; 
	u5: contador_programa PORT MAP (PC_IN_signal, INCP_signal,PC_out_signal);
			
       
-- flip_flop_d map
	Din_signal <= z_signal;
	EN_signal <= EZ_IN;
	u2: flip_flop_d PORT MAP (Din_signal, EN_signal, Q_signal);
	FZ_OUT<= Q_sinal;
			
--map MP
	DIR_signal <= salida_Z_signal;
	LE_sigal<=L_E_IN;
	I_signal<=	salida_ual_signal;
	u3: MP PORT MAP (DIR_signal , I_signal, LE_sigal, O_mp_signal);
			
END entradas_up_mp;
