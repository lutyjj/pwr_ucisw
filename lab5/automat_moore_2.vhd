----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:58:20 11/25/2020 
-- Design Name: 
-- Module Name:    automat_moore_2 - dataflow 
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

entity automat_moore_2 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           x : in  STD_LOGIC;
           y : out  STD_LOGIC);
end automat_moore_2;

architecture dataflow of automat_moore_2 is
	type state_type is (Q0, Q1, Q2, Q3, Q4, Q5, Q6);
	signal state, next_state : state_type;
	
begin
	process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				state <= Q0;
			else
				state <= next_state;
			end if;
		end if;
	end process;
	
	process(state, x)
	begin
		next_state <= state;
		
		case state is
			when Q0 =>
				if x = '1' then
					next_state <= Q1;
				end if;
				
			when Q1 =>
				if x = '0' then
					next_state <= Q2;
				end if;
				
			when Q2 =>
				if x = '0' then
					next_state <= Q3;
				else
					next_state <= Q1;
				end if;
				
			when Q3 =>
				if x = '0' then
					next_state <= Q0;
				else
					next_state <= Q4;
				end if;
				
			when Q4 =>
				if x = '0' then
					next_state <= Q2;
				else
					next_state <= Q5;
				end if;
				
			when Q5 =>
				if x = '0' then
					next_state <= Q2;
				else
					next_state <= Q6;
				end if;
				
			when Q6 =>
				if x = '0' then
					next_state <= Q0;
				else
					next_state <= Q1;
				end if;
		end case;
	end process;
	
	-- process 3
	y <= '1' when state = Q6
				else '0';

end dataflow;

