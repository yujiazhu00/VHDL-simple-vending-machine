LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Vending_new_tb IS
END Vending_new_tb;

architecture Vending_new_tb_arch of Vending_new_tb is

component Vending_new
port(Clock : IN  std_logic;
Reset : IN  std_logic;
Q_in : IN  std_logic;
D_in : IN std_logic;
Dispense : OUT std_logic;
Lock_dollar: OUT std_logic;
Change : OUT  std_logic);
end component;

signal Clock_TB : std_logic := '0'; 
signal Reset_TB : std_logic := '1';
signal Q_in_TB : std_logic;
signal D_in_TB : std_logic;
signal Dispense_TB : std_logic;
signal Lock_dollar_TB : std_logic;
signal Change_TB : std_logic;


constant clock_period : time := 20 ns;

begin

DUT1 : Vending_new port map (Clock => Clock_TB,
			Reset => Reset_TB,
			Q_in => Q_in_TB,
			D_in => D_in_TB,
			Dispense => Dispense_TB,
			Lock_dollar => Lock_dollar_TB,
			Change => Change_TB);

-- Clock process definitions
Clock_process : process
begin
Clock_TB <= '0';
wait for clock_period/2;
Clock_TB <= '1';
wait for clock_period/2;
end process;

-- Stimulus process
stim_proc: process
begin 

Reset_TB <= '0';
D_in_TB <= '0';
Q_in_TB <= '0';
wait for 2 ns;

Reset_TB <= '1';
D_in_TB <= '1';
Q_in_TB <= '0';
wait for 8 ns;

D_in_TB <= '0';
Q_in_TB <= '0';
wait for 15 ns;
D_in_TB <= '0';
Q_in_TB <= '1';
wait for 5 ns;
D_in_TB <= '0';
Q_in_TB <= '0';
wait for 15 ns;
D_in_TB <= '0';
Q_in_TB <= '1';
wait for 5 ns;
D_in_TB <= '0';
Q_in_TB <= '0';
wait for 15 ns;
D_in_TB <= '0';
Q_in_TB <= '1';
wait for 5 ns;
D_in_TB <= '0';
Q_in_TB <= '0';
wait for 15 ns;
end process;
end architecture;
