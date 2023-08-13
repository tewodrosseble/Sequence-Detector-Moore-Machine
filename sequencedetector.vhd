library ieee;
use ieee.std_logic_1164.all;

entity sequencedetector is port (
input : in std_logic;
reset : in std_logic; 
clock : in std_logic;
output : out std_logic);

end entity;
architecture behaviour of sequencedetector is 
type states_list is (s0, s1, s2);
signal state : states_list;
begin 
	process(reset, clock)
	begin 
	if (reset = '1') then 
		state <= s0;
	elsif rising_edge(clock) then
		case (state) is 
			when s0 =>
				if input = '1' then 
					state <= s1;
				else 
					state <= s0;
				end if;
			when s1 => 
				if input = '0' then 
					state <= s2;
				else 
					state <= s1;
				end if ;
			when s2 => 
				if input = '0' then 
					state <= s0;
				else 
					state <= s1;
				end if;
		end case;
	end if ;
end process;
--output logic 
output <= '1' when state = s2 else 
		'0';
end behaviour;