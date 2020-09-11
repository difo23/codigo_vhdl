library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_d is
    Port ( D  : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Q  : out STD_LOGIC);
end flip_flop_d;

architecture Behavioral of flip_flop_d is
    signal DATA : STD_LOGIC;
begin

    DATA <= D when (EN = '1') else DATA;
    Q <= DATA;
end Behavioral;
