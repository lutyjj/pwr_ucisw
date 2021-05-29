----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:17 12/22/2020 
-- Design Name: 
-- Module Name:    ps2_rx - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ps2_rx is
    Port ( DO : in  STD_LOGIC_VECTOR (7 downto 0);
           F0 : in  STD_LOGIC;
           DO_Rdy : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end ps2_rx;

architecture Behavioral of ps2_rx is
	type state_type is (Q0, Q1, Q2, Q3, Q4);
	signal state, next_state : state_type;
begin
	process1: process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				state <= Q0;
			else
				state <= next_state;
			end if;
		end if;
	end process process1;
	
	process2: process(state, DO, DO_Rdy)
	begin
		next_state <= state;
		
		if DO_Rdy = '1' and F0 = '0' then
			case state is
				when Q0 =>
					if DO = X"23" then --D
						next_state <= Q1;
					end if;
					
				when Q1 =>
					if DO = X"1C" then
						next_state <= Q2;
					end if;
				
				when Q2 =>
					if DO = X"2D" then
						next_state <= Q3;
					end if;
					
				when Q3 =>
					if DO = X"35" then
						next_state <= Q4;
					end if;
					
				when Q4 =>
					if DO = X"23" then 
						next_state <= Q1;
					else 
						next_state <= Q0;
					end if;
					
				when others => next_state <= Q0;
			end case;
		end if;
	end process process2;
	
	Y <= '1' when state = Q4
				else '0';

end Behavioral;

