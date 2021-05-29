----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:07 12/09/2020 
-- Design Name: 
-- Module Name:    ps2_lock - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ps2_lock is
    Port ( DO : in  STD_LOGIC_VECTOR (7 downto 0);
           DO_Rdy : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Y : out  STD_LOGIC;
			  COUNTER : out STD_LOGIC_VECTOR(3 downto 0)
			  );
			  
end ps2_lock;

architecture Behavioral of ps2_lock is
	type state_type is (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12);
	signal state, next_state : state_type;
	signal count : UNSIGNED(3 downto 0) := "0000";
	
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
		
		if DO_Rdy = '1' then
			case state is
				when Q0 =>
					if DO = X"23" then --D
						next_state <= Q1;
					end if;
					
				when Q1 =>
					if DO = X"F0" then
						next_state <= Q2;
					end if;
				
				when Q2 =>
					if DO = X"23" then
						next_state <= Q3;
					end if;
					
				when Q3 =>
					if DO = X"1C" then --A
						next_state <= Q4;
					elsif DO = X"23" then
						next_state <= Q1;
					else
						next_state <= Q0;
					end if;
					
				when Q4 =>
					if DO = X"F0" then
						next_state <= Q5;
					end if;
					
				when Q5 =>
					if DO = X"1C" then
						next_state <= Q6;
					end if;
					
				when Q6 =>
					if DO = X"2D" then --R
						next_state <= Q7;
					elsif DO = X"23" then
						next_state <= Q1;
					else
						next_state <= Q0;
					end if;
					
				when Q7 =>
					if DO = X"F0" then
						next_state <= Q8;
					end if;
					
				when Q8 =>
					if DO = X"2D" then
						next_state <= Q9;
					end if;
					
				when Q9 =>
					if DO = X"35" then --Y
						next_state <= Q10;
					elsif DO = X"23" then
						next_state <= Q1;
					else
						next_state <= Q0;
					end if;
					
				when Q10 =>
					if DO = X"F0" then
						next_state <= Q11;
					end if;
					
				when Q11 =>
					if DO = X"35" then
						next_state <= Q12;
					end if;
					
				when Q12 =>
					if DO = X"23" then
						next_state <= Q1;
					else
						next_state <= Q0;
					end if;
					
				when others => next_state <= Q0;
			end case;
		end if;
	end process process2;
	
	y <= '1' when state = Q12
				else '0';
	
	process4: process(Clk)
	begin
		if Reset = '1' then
			count <= "0000";
		elsif rising_edge(Clk) and next_state = Q12 and DO_Rdy = '1' then
			count <= count + 1;
		end if;
	end process process4;
	
	COUNTER <= std_logic_vector(count);
	
end Behavioral;

