library IEEE;
use IEEE.std_logic_1164.all;
entity Vending_new is
port (Clock, Reset: in std_logic;
	D_in, Q_in: in std_logic;
	Dispense, Change, Lock_dollar: out std_logic);
end entity;
architecture Vending_new_arch of Vending_new is

type State_type is (sWait,s25,s50);
signal current_state, next_state: State_type;

begin
STATE_MEMORY: process(clock,reset)
begin
if (Reset='0') then current_state <= sWait;
elsif (Clock'event and Clock='1') then current_state <= next_state;
end if;
end process;

NEXT_STATE_LOGIC:process(current_state,D_in,Q_in)
begin
case(current_state) is 

when sWait => if (Q_in = '1') then next_state <= s25;
else next_state <= sWait;
end if;

when s25 => if (Q_in = '1') then next_state <= s50;
else next_state <= s25;
end if;

when s50 => if (Q_in='1') then next_state <= sWait;
else next_state <= s50;
end if;

when others => next_state <= sWait;
end case;
end process;

OUTPUT_LOGIC: process(current_state,D_in,Q_in)
begin
case (current_state) is

when sWait => if (D_in = '1') then Dispense <= '1'; Change <= '1'; Lock_dollar <= '1';
else Dispense <= '0'; Change<='0'; Lock_dollar <= '0';
end if;

when s25 => Dispense <= '0'; Change<='0'; Lock_dollar <= '1';

when s50 => if (Q_in = '1') then Dispense <= '1'; Change <= '0'; Lock_dollar <= '1';
else Dispense<= '0'; Change <= '0'; Lock_dollar <= '1';
end if;

when others => Dispense <='0'; Change <= '0'; Lock_dollar <= '0';

end case;
end process;
end architecture;
