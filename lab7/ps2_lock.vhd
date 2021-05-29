library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ps2_lock is
    Port ( DO : in  STD_LOGIC_VECTOR (7 downto 0);
           F0 : in  STD_LOGIC;
           DO_Rdy : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           y : inout  STD_LOGIC;
			  TxStart : inout STD_LOGIC;
			  TxDI : out STD_LOGIC_VECTOR (7 downto 0);
			  TxBusy: in STD_LOGIC);
end ps2_lock;

architecture Behavioral of ps2_lock is
	type state_type is (Q0, Q1, Q2, Q3, Q3A, Q3B, Q3C, Q4);
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
	
	process2: process(state, DO, DO_Rdy, F0)
	begin
		next_state <= state;
		
		if DO_Rdy = '1' and F0 = '0' then
			case state is
				when Q0 =>
					if DO = X"23" then --D
						next_state <= Q1;
					end if;
					
				when Q1 =>
					if DO = X"1C" then --A
						next_state <= Q2;
					elsif DO = X"23" then
						next_state <= Q1;
					else
						next_state <= Q0;
					end if;
				
				when Q2 =>
					if DO = X"2D" then --R
						next_state <= Q3;
					elsif DO = X"23" then
						next_state <= Q1;
					else
						next_state <= Q0;
					end if;
					
				when Q3 =>
					if DO = X"35" then --Y
						next_state <= Q3A;
					elsif DO = X"23" then
						next_state <= Q1;
					else
						next_state <= Q0;
					end if;
					
				when Q4 =>
					if DO = X"23" then 
						next_state <= Q1;
					else 
						next_state <= Q0;
					end if;
					
				when others => null;
			end case;
			
		else
			if state = Q3A then
				next_state <= Q3B;
			elsif state = Q3B then
				if TxBusy = '0' then 
					next_state <= Q3C;
				end if;
			elsif state = Q3C then			
				next_state <= Q4;
			end if;
		end if;
	end process process2;
	
	Y <= '1' when state = Q4
				else '0';
	
	process_detect: process(state, next_state, Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				TxStart <= '0';
			else
				TxStart <= '0';
				
				if next_state = Q3A then
					TxStart <= '1';
				elsif next_state = Q3C then
					TxStart <= '1';
				end if;
			end if;  
		end if;
	end process process_detect;
	 
	process3: process(TxStart, TxBusy)
	begin
		case TxStart is
			when '1' =>
				if state = Q3A then
					TxDI <= X"44";
				else
					TxDI <= X"42";
				end if;
			when others => TxDI <= X"00";
		end case;
	end process process3;
end Behavioral;
